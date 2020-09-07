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
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.textColor = UIColor(red: 9/255, green: 155/255, blue: 160/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    lazy var bottomColorFundoView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.heightAnchor.constraint(equalToConstant: 7).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lineSeparatorView: UIView = {
        let view = UIView(frame: .zero)
        view.heightAnchor.constraint(equalToConstant: 0.7).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
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
        label.numberOfLines = 1
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
        view.layer.borderWidth = 0.2
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.18
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var vStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 2
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

extension HistoricoViewCell {
    func setupUI() {
        self.contentView.addSubview(cellView)
        cellView.addSubview(vStackView)
        vStackView.addArrangedSubview(nameFundoLabel)
        vStackView.addArrangedSubview(lineSeparatorView)
        vStackView.addArrangedSubview(nameFundoRiskLabel)
        vStackView.addArrangedSubview(aplicacaoViewLabel)
        vStackView.addArrangedSubview(aplicacaoMinimaLabel)
        vStackView.addArrangedSubview(bottomColorFundoView)
        
        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            cellView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            vStackView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            vStackView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            vStackView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            vStackView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),


        ])
    }
}
