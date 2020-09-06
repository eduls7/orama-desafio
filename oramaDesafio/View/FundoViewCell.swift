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
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.textColor = UIColor(red: 9/255, green: 155/255, blue: 160/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        return label
    }()
    
    lazy var leftColorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var aplicacaoMinimaLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false

        label.numberOfLines = 2
        return label
    }()
    
    lazy var nameFundoRiskLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.textColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.systemGray.cgColor
        view.layer.borderWidth = 0.2
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.15
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
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
        cellView.addSubview(leftColorView)
        cellView.addSubview(nameFundoLabel)
        cellView.addSubview(aplicacaoMinimaLabel)
        cellView.addSubview(nameFundoRiskLabel)
        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            //cellView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            leftColorView.widthAnchor.constraint(equalToConstant: 7),
            leftColorView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            leftColorView.topAnchor.constraint(equalTo: cellView.topAnchor),
            leftColorView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),


            nameFundoLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 5),
            nameFundoLabel.leadingAnchor.constraint(equalTo: leftColorView.leadingAnchor, constant: 15),
            nameFundoLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10),
            nameFundoLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 1/2.5),
            //nameFundoLabel.trailingAnchor.constraint(equalTo: nameFundoRiskLabel.leadingAnchor, constant: 10),
            
            //nameFundoRiskLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 5),
            nameFundoRiskLabel.bottomAnchor.constraint(equalTo: aplicacaoMinimaLabel.topAnchor, constant: -10),
            nameFundoRiskLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            nameFundoRiskLabel.leadingAnchor.constraint(equalTo: nameFundoLabel.trailingAnchor, constant: 69),
            nameFundoLabel.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 1/2.5),
            
            
            aplicacaoMinimaLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            aplicacaoMinimaLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -20),
            //aplicacaoMinimaLabel.leadingAnchor.constraint(equalTo: nameFundoRiskLabel.trailingAnchor, constant: 20),
            
            
            

        ])
    }
}
