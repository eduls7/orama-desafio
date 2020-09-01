//
//  Fundos.swift
//  oramaDesafio
//
//  Created by Eduardo  on 01/09/20.
//  Copyright © 2020 Eduardo . All rights reserved.
//

import Foundation


struct Fundo: Codable {
    let name: String
    let fullName: String
    let initialDate: String
    let operability: Operability
    let specification: Specification
    let strategyVideo: StrategyVideo?
    let fundManager: FundManager
    
    enum CodingKeys: String, CodingKey {
        case name = "simple_name"
        case fullName = "full_name"
        case operability
        case specification
        case initialDate = "initial_date"
        case strategyVideo = "strategy_video"
        case fundManager = "fund_manager"
    }
}

struct Operability: Codable {
    let applicationMinimum: String
    
    enum CodingKeys: String, CodingKey {
        case applicationMinimum = "minimum_initial_application_amount"
    }
}

struct Specification: Codable {
    let fundRisk: FundRisk
    
    enum CodingKeys: String, CodingKey {
        case fundRisk = "fund_risk_profile"
    }
}

struct FundRisk: Codable {
    let name: String
}

struct StrategyVideo: Codable {
    let thumbnail: String?
}

struct FundManager: Codable {
    let description: String
}
