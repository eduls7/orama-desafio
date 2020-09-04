//
//  HistoricoViewController.swift
//  oramaDesafio
//
//  Created by Eduardo  on 03/09/20.
//  Copyright © 2020 Eduardo . All rights reserved.
//

import UIKit

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
    var fundos: [Fundo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
}

extension HistoricoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fundos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HistoricoViewCell", for: indexPath) as! HistoricoViewCell
        
        cell.nameFundoLabel.text = fundos[indexPath.row].simpleName
        cell.nameFundoRiskLabel.text = fundos[indexPath.row].specification.fundRisk.name
        let aplicacaoMinimaFormated = fundos[indexPath.row].operability.applicationMinimum.replacingOccurrences(of: ".", with: ",")
        cell.aplicacaoMinimaLabel.text = "R$ \(aplicacaoMinimaFormated)"
        
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
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: 220)
            
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
