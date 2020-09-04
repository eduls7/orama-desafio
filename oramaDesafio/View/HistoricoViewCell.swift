//
//  HistoricoCollectionViewCell.swift
//  oramaDesafio
//
//  Created by Eduardo  on 03/09/20.
//  Copyright © 2020 Eduardo . All rights reserved.
//

import UIKit

class HistoricoViewCell: UICollectionViewCell {
    lazy var nameFundoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(red: 9/255, green: 155/255, blue: 160/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        return label
    }()
    
    lazy var bottomColorFundoView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 9/255, green: 155/255, blue: 160/255, alpha: 1)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lineSeparatorView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray
        return view
    }()
    
    lazy var aplicacaoMinimaLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        
        label.translatesAutoresizingMaskIntoConstraints = false

        label.numberOfLines = 1
        return label
    }()
    
    lazy var nameFundoRiskLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = label.font.withSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    lazy var aplicacaoViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Aplicação mínima"
        label.textAlignment = .center
        label.font = label.font.withSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.borderWidth = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HistoricoViewCell {
    func setupUI() {
        self.contentView.addSubview(cellView)
        cellView.addSubview(bottomColorFundoView)
        cellView.addSubview(nameFundoLabel)
        cellView.addSubview(lineSeparatorView)
        cellView.addSubview(aplicacaoViewLabel)
        cellView.addSubview(aplicacaoMinimaLabel)
        cellView.addSubview(nameFundoRiskLabel)
        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),

            bottomColorFundoView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            bottomColorFundoView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            bottomColorFundoView.heightAnchor.constraint(equalToConstant: 10),
            bottomColorFundoView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),


            nameFundoLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 20),
            nameFundoLabel.leadingAnchor.constraint(equalTo: bottomColorFundoView.leadingAnchor, constant: 10),
            nameFundoLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            
            
            lineSeparatorView.heightAnchor.constraint(equalToConstant: 0.5),
            lineSeparatorView.topAnchor.constraint(equalTo: nameFundoLabel.bottomAnchor, constant: 20),
            lineSeparatorView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 0),
            lineSeparatorView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: 0),
            
            
            nameFundoRiskLabel.topAnchor.constraint(equalTo: lineSeparatorView.bottomAnchor, constant: 5),
            nameFundoRiskLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            nameFundoRiskLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            
            
            aplicacaoViewLabel.topAnchor.constraint(equalTo: nameFundoRiskLabel.bottomAnchor, constant: 15),
            aplicacaoViewLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            aplicacaoViewLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            
            aplicacaoMinimaLabel.topAnchor.constraint(equalTo: aplicacaoViewLabel.bottomAnchor, constant: 5),
            aplicacaoMinimaLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            aplicacaoMinimaLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            //aplicacaoMinimaLabel.bottomAnchor.constraint(equalTo: bottomColorFundoView.topAnchor, constant: -5),
            
            
            
            

        ])
    }
}
