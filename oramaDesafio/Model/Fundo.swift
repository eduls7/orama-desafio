//
//  Fundo.swift
//  oramaDesafio
//
//  Created by Eduardo  on 05/09/20.
//  Copyright © 2020 Eduardo . All rights reserved.
//

import Foundation
import RealmSwift

class FundoDB: Object {
    @objc dynamic var SimpleName: String?
    @objc dynamic var fullName: String?
    @objc dynamic var initialDate: String?
    @objc dynamic var overview: String?
    @objc dynamic var risk: String?
    @objc dynamic var applicationMinimum: String?
}
