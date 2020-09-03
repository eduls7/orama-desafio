//
//  FundosCollectionViewCell.swift
//  oramaDesafio
//
//  Created by Eduardo  on 01/09/20.
//  Copyright © 2020 Eduardo . All rights reserved.
//

import UIKit

class FundoViewCell: UICollectionViewCell {
    
    lazy var nameFundoLabel: UILabel = {
        let label = UILabel()
        //label.lineBreakMode = .byTruncatingMiddle
        label.textAlignment = .center
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.sizeToFit()
        label.numberOfLines = 3
        return label
    }()
    
    lazy var leftColorFundoView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var aplicacaoMinimaLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.sizeToFit()
        label.numberOfLines = 2
        return label
    }()
    
    lazy var nameFundoRiskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.sizeToFit()
        label.numberOfLines = 1
        return label
    }()
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.borderWidth = 1
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

extension FundoViewCell {
    func setupUI() {
        self.contentView.addSubview(cellView)
        cellView.addSubview(leftColorFundoView)
        cellView.addSubview(nameFundoLabel)
        cellView.addSubview(aplicacaoMinimaLabel)
        cellView.addSubview(nameFundoRiskLabel)
        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            leftColorFundoView.widthAnchor.constraint(equalToConstant: 10),
            leftColorFundoView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            leftColorFundoView.topAnchor.constraint(equalTo: cellView.topAnchor),
            leftColorFundoView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),


            nameFundoLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 5),
            nameFundoLabel.leadingAnchor.constraint(equalTo: leftColorFundoView.leadingAnchor, constant: 10),
            nameFundoLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10),
            nameFundoLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 1/2),
            //nameFundoLabel.trailingAnchor.constraint(equalTo: nameFundoRiskLabel.leadingAnchor, constant: 10),
            
            //nameFundoRiskLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 5),
            nameFundoRiskLabel.bottomAnchor.constraint(equalTo: aplicacaoMinimaLabel.topAnchor, constant: -10),
            nameFundoRiskLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            nameFundoRiskLabel.leadingAnchor.constraint(greaterThanOrEqualTo: nameFundoLabel.trailingAnchor, constant: 20),
            
            
            aplicacaoMinimaLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            aplicacaoMinimaLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -20),
            //aplicacaoMinimaLabel.leadingAnchor.constraint(equalTo: nameFundoRiskLabel.trailingAnchor, constant: 20),
            
            
            

        ])
    }
}
