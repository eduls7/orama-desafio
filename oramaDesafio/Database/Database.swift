//
//  Database.swift
//  oramaDesafio
//
//  Created by Eduardo  on 06/09/20.
//  Copyright © 2020 Eduardo . All rights reserved.
//

import Foundation
import UIKit
import RealmSwift



class Database {
    var realm = try! Realm()
    

    func getFundos () -> Results<FundoDB> {
        return realm.objects(FundoDB.self)
    }
    
    func saveFundo (_ fundo: Fundo) -> Bool {
        let fundoDB = FundoDB()
        fundoDB.simpleName = fundo.simpleName
        fundoDB.fullName = fundo.fullName
        fundoDB.overview = fundo.fundManager.description
        fundoDB.applicationMinimum = fundo.operability.applicationMinimum
        fundoDB.risk = fundo.specification.fundRisk.name
        let dateFormated = fundo.initialDate.replacingOccurrences(of: "-", with: "/")
        fundoDB.initialDate = dateFormated
        
        let results = realm.objects(FundoDB.self).filter("simpleName = '\(fundo.simpleName)'" )
    
        if (results.count == 0) {
            do {
                try realm.write {
                    realm.add(fundoDB)
                }
                return true
            } catch  {
                print("Failure write in Realm database. Error: \(error)")
                return false
            }
        }
        return false
    }
}
