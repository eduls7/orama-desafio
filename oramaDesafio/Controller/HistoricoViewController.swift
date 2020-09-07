//
//  HistoricoViewController.swift
//  oramaDesafio
//
//  Created by Eduardo  on 03/09/20.
//  Copyright © 2020 Eduardo . All rights reserved.
//

import UIKit
import RealmSwift

class HistoricoViewController: UIViewController {
    
    //MARK: - Properties Layout
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.backgroundColor = .white
        collectionView.register(HistoricoViewCell.self, forCellWithReuseIdentifier: "HistoricoViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    //MARK: - Properties
    let database = Database()
    lazy var fundosDB = database.getFundos()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
     
    }
    
    func setupColorCells (risk: String, view: UIView) {
        switch risk {
            case "2":
                view.backgroundColor =
                    UIColor(red: 101/255, green: 241/255, blue: 222/255, alpha: 1)
                break
            case "3":
                view.backgroundColor =
                UIColor(red: 143/255, green: 237/255, blue: 109/255, alpha: 1)
                break
            case "4":
                view.backgroundColor =
                UIColor(red: 175/255, green: 244/255, blue: 44/255, alpha: 1)
                break
            case "8":
                view.backgroundColor =
                UIColor(red: 253/255, green: 187/255, blue: 6/255, alpha: 1)
                break
            case "11":
                view.backgroundColor =
                UIColor(red: 252/255, green: 5/255, blue: 0/255, alpha: 1)
                break
            default:
                print("Nada")
                break
        }
    }
    

}

extension HistoricoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fundosDB.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistoricoViewCell", for: indexPath) as! HistoricoViewCell
        
        
        cell.nameFundoLabel.text = fundosDB[indexPath.row].simpleName
        cell.nameFundoRiskLabel.text = fundosDB[indexPath.row].risk
        let aplicacaoMinimaFormated = fundosDB[indexPath.row].applicationMinimum.replacingOccurrences(of: ".", with: ",")
        cell.aplicacaoMinimaLabel.text = "R$ \(aplicacaoMinimaFormated)"
        let risk = fundosDB[indexPath.row].risk
        let str = risk.westernArabicNumeralsOnly
        
        setupColorCells(risk: str, view: cell.bottomColorFundoView)
        
        
        return cell
    }
    
    
    
    
}

extension HistoricoViewController {
    func setupUI () {
        self.navigationItem.title = "Histórico de Compras"
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
                        
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 15),
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -15),
            collectionView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1/1.78)
            
        ])
    }
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let cellWidthConstant: CGFloat = UIScreen.main.bounds.width * 0.35
        let cellHeightConstant: CGFloat = UIScreen.main.bounds.width * 0.55
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: cellWidthConstant, height: cellHeightConstant)
    
        return layout
    }
}
