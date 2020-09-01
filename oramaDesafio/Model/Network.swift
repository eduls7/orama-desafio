//
//  Network.swift
//  oramaDesafio
//
//  Created by Eduardo  on 01/09/20.
//  Copyright © 2020 Eduardo . All rights reserved.
//

import Foundation
import Alamofire

class Network {
    let params = "https://s3.amazonaws.com/orama-media/json/fund_detail_full.json"
    
    func fetchJSON (completionHandler: @escaping ([Fundo]) -> Void) {
        AF.request(params, method: .get).validate().responseDecodable(of: Array<Fundo>.self) { (response) in
            switch response.result {
            case .success:
                if let jsonResponse = response.value {
                    completionHandler(jsonResponse)
                }
                break
            case .failure:
                print("Error with JSON Decoder: \(String(describing: response.error)) ")
                break
            }
        }
    }
}
