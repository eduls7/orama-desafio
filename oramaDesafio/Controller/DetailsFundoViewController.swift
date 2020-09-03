//
//  LayoutHomeFundosViewController.swift
//  oramaDesafio
//
//  Created by Eduardo  on 01/09/20.
//  Copyright © 2020 Eduardo . All rights reserved.
//

import UIKit

class DetailsFundoViewController: UIViewController {
    
    //MARK: - PROPERTIES LAYOUT
    lazy var simpleName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica Neue", size: 20)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    lazy var dadosFundoViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Dados do Fundo"
        label.textColor = UIColor(red: 9/255, green: 155/255, blue: 160/255, alpha: 1)
        label.font = UIFont(name: "Helvetica Neue", size: 18)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var nameViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome Completo"
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.font.withSize(12)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var descricaoViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Descrição do Fundo"
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var descricaoFundoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    lazy var dateViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Data de início"
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var initialDataLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var fundManagerDescriptionLabel: UILabel = {
        let label = UILabel()
        
        //label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var videoThumbnail: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
        
    //MARK: - INITIALIZERS
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
}


extension DetailsFundoViewController {
    
    func setupUI() {
        
        self.view.backgroundColor = .white
        self.view.addSubview(simpleName)
        self.view.addSubview(dadosFundoViewLabel)
        self.view.addSubview(nameViewLabel)
        self.view.addSubview(fullNameLabel)
        self.view.addSubview(descricaoViewLabel)
        self.view.addSubview(descricaoFundoLabel)
        self.view.addSubview(dateViewLabel)
        self.view.addSubview(initialDataLabel)
        
        NSLayoutConstraint.activate([
            simpleName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            simpleName.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            simpleName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            dadosFundoViewLabel.topAnchor.constraint(equalTo: simpleName.bottomAnchor, constant: 50),
            dadosFundoViewLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            dadosFundoViewLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            
            nameViewLabel.topAnchor.constraint(equalTo: dadosFundoViewLabel.bottomAnchor, constant: 20),
            nameViewLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            nameViewLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            fullNameLabel.topAnchor.constraint(equalTo: nameViewLabel.bottomAnchor, constant: 20),
            fullNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            fullNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            descricaoViewLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 20),
            descricaoViewLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            descricaoViewLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            
            descricaoFundoLabel.topAnchor.constraint(equalTo: descricaoViewLabel.bottomAnchor, constant: 20),
            descricaoFundoLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            descricaoFundoLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            
            dateViewLabel.topAnchor.constraint(equalTo: descricaoFundoLabel.bottomAnchor, constant: 20),
            dateViewLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            dateViewLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            
            initialDataLabel.topAnchor.constraint(equalTo: dateViewLabel.bottomAnchor, constant: 20),
            initialDataLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            initialDataLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
        ])
    }
}








































