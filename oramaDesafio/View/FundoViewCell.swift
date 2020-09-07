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
        view.widthAnchor.constraint(equalToConstant: 7).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var aplicacaoMinimaLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false

        label.numberOfLines = 2
        return label
    }()
    
    lazy var nameFundoRiskLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.textAlignment = .center
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
    
    lazy var vStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var hStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
        cellView.addSubview(hStackView)
        hStackView.addArrangedSubview(leftColorView)
        hStackView.addArrangedSubview(nameFundoLabel)
        
        
        cellView.addSubview(vStackView)
        vStackView.addArrangedSubview(nameFundoRiskLabel)
        vStackView.addArrangedSubview(aplicacaoMinimaLabel)


        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            hStackView.topAnchor.constraint(equalTo: cellView.topAnchor),
            hStackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 1/2),
            hStackView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            hStackView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            
            vStackView.topAnchor.constraint(equalTo: cellView.topAnchor),
            vStackView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 1/2),
            vStackView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            vStackView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            

        ])
    }
}
