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
    @objc dynamic var simpleName = ""
    @objc dynamic var fullName = ""
    @objc dynamic var initialDate = ""
    @objc dynamic var overview = ""
    @objc dynamic var risk = ""
    @objc dynamic var applicationMinimum = ""
}
