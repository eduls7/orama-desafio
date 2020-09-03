//
//  ViewController.swift
//  oramaDesafio
//
//  Created by Eduardo  on 31/08/20.
//  Copyright © 2020 Eduardo . All rights reserved.
//

import UIKit

class FundoCollectionViewController: UIViewController  {

    
    
    //MARK: - Properties
    let network = Network()
    var fundos: [Fundo] = []
    
    //MARK: - Properties Layout Interface
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.backgroundColor = .white
        collectionView.register(FundoViewCell.self, forCellWithReuseIdentifier: "FundoViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var historicoButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Histórico", style: .plain, target: self, action: #selector(buttonHistorico(button:)))
        

        return button
    }()
    
    @objc func buttonHistorico (button: UIButton) {
        print("opa")
    }
    
    
    //MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        getFundos()
        
    }


}

extension FundoCollectionViewController {
    
    func getFundos() {
        network.fetchJSON { (fundosResponse) in
            for index in 0..<6 {
                self.fundos.append(fundosResponse[index])
                //print(self.fundos[index].operability.applicationMinimum)
                self.setupUI()
            }
        }
    }
}

//MARK: - SetupUI
extension FundoCollectionViewController {
    
    
    func setupUI () {
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        configNavigationBar()
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configNavigationBar () {
        if let navigationController = self.navigationController {
            self.navigationItem.title = "Fundos"
            navigationController.navigationBar.barTintColor = UIColor(red: 9/255, green: 155/255, blue: 160/255, alpha: 1)
            self.navigationItem.rightBarButtonItem = historicoButton
        }
        
    }
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        let cellWidthConstant: CGFloat = UIScreen.main.bounds.width * 0.95
        let cellHeightConstant: CGFloat = UIScreen.main.bounds.height * 0.15
        
        layout.sectionInset = UIEdgeInsets(top: 10,
                                           left: 0,
                                           bottom: 0,
                                           right: 0)
        layout.scrollDirection = .vertical
    
        layout.minimumLineSpacing = 15
        layout.itemSize = CGSize(width: cellWidthConstant, height: cellHeightConstant)
        
        return layout
    }
}

//MARK: - Data Source and Delegate
extension FundoCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fundos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FundoViewCell", for: indexPath) as! FundoViewCell
        
        cell.nameFundoLabel.text = fundos[indexPath.row].simpleName
        cell.nameFundoRiskLabel.text = fundos[indexPath.row].specification.fundRisk.name
        let aplicacaoMinimaFormated = fundos[indexPath.row].operability.applicationMinimum.replacingOccurrences(of: ".", with: ",")
        cell.aplicacaoMinimaLabel.text = "Aplicação mínima\n R$ \(aplicacaoMinimaFormated)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailFundoViewController = DetailsFundoViewController()
        
        detailFundoViewController.simpleName.text = fundos[indexPath.row].simpleName
        detailFundoViewController.fullNameLabel.text = fundos[indexPath.row].fullName
        detailFundoViewController.initialDataLabel.text = fundos[indexPath.row].initialDate
        detailFundoViewController.descricaoFundoLabel.text = fundos[indexPath.row].fundManager.description
        
        navigationController?.pushViewController(detailFundoViewController, animated: true)
        
    }
    
    
}

