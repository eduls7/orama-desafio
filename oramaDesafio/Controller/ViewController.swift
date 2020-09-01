//
//  ViewController.swift
//  oramaDesafio
//
//  Created by Eduardo  on 31/08/20.
//  Copyright © 2020 Eduardo . All rights reserved.
//

import UIKit

class FundosCollectionViewController: UIViewController {
    
    //MARK: - Properties
    let network = Network()
    var fundos: [Fundo] = []
    
    //MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        
        getFundos()
    }


}

extension FundosCollectionViewController {
    
    func getFundos() {
        network.fetchJSON { (fundosResponse) in
            for index in 0..<6 {
                self.fundos.append(fundosResponse[index])
                print(self.fundos[index].operability.applicationMinimum)
            }
        }
    }
    
}

