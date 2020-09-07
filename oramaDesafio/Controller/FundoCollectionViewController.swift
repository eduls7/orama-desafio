//
//  ViewController.swift
//  oramaDesafio
//
//  Created by Eduardo  on 31/08/20.
//  Copyright © 2020 Eduardo . All rights reserved.
//

import UIKit
import RealmSwift

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
        let buttonBar = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(buttonHistorico(button:)))
        
        return buttonBar
    }()
    let realm = try! Realm()
    lazy var fundosDB: Results<FundoDB> = { realm.objects(FundoDB.self) }()
    
    //MARK: - Initializers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        getFundos()
    }
}

// MARK: - Functions
extension FundoCollectionViewController {
    
    func getFundos() {
        network.fetchJSON { (fundosResponse) in
            for index in 0..<6 {
                self.fundos.append(fundosResponse[index])
            }
            self.collectionView.reloadData()
        }
    }
    
    @objc func buttonHistorico (button: UIButton) {
        let historicoViewController = HistoricoViewController()

        navigationController?.pushViewController(historicoViewController, animated: true)
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
                break
        }
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
        cell.aplicacaoMinimaLabel.text = "Aplicação mínima\nR$ \(aplicacaoMinimaFormated)"
        
        let risco = fundos[indexPath.row].specification.fundRisk.name
        let str = risco.westernArabicNumeralsOnly
        setupColorCells(risk: str, view: cell.leftColorView)
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailFundoViewController = DetailsFundoViewController()
        
        detailFundoViewController.fundo = fundos[indexPath.row]
        navigationController?.pushViewController(detailFundoViewController, animated: true)
    }
}

//MARK: - SetupUI
extension FundoCollectionViewController {
    
    func setupUI () {
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        configNavigationBar()
        
        NSLayoutConstraint.activate([
                        
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func configNavigationBar () {
        if let navigationController = self.navigationController {
            navigationController.navigationBar.tintColor = .white
            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            navigationController.navigationBar.titleTextAttributes = textAttributes
            self.navigationItem.title = "Fundos"
            navigationController.navigationBar.barTintColor = UIColor(red: 9/255, green: 155/255, blue: 160/255, alpha: 1)
            self.navigationItem.rightBarButtonItem = historicoButton
        }
        
    }
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        
        let cellWidthConstant: CGFloat = UIScreen.main.bounds.width * 0.95
        let cellHeightConstant: CGFloat = UIScreen.main.bounds.height * 0.15
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0,bottom: 0, right: 0)
        layout.scrollDirection = .vertical
    
        layout.minimumLineSpacing = 15
        layout.itemSize = CGSize(width: cellWidthConstant, height: cellHeightConstant)
        
        return layout
    }
}

extension String {
    var westernArabicNumeralsOnly: String {
        let pattern = UnicodeScalar("0")..."9"
        return String(unicodeScalars
            .compactMap({ pattern ~= $0 ? Character($0) : nil })
        )
    }
}

