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
    lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var simpleName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        //label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    lazy var dadosFundoViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Dados do Fundo"
        label.textColor = UIColor(red: 9/255, green: 155/255, blue: 160/255, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var nameViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome Completo"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        label.textColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var descricaoViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Descrição do Fundo"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var descricaoFundoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        label.textColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        return label
    }()
    
    lazy var dateViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Data de início"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var initialDataLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "Helvetica Neue", size: 14)
        label.textColor = UIColor(red: 90/255, green: 90/255, blue: 90/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    lazy var imageThumbnail: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    lazy var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Comprar Fundo", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 9/255, green: 155/255, blue: 160/255, alpha: 1)
        button.addTarget(self, action: #selector(buyButtonAction(button:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    //MARK: - INITIALIZERS
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    @objc func buyButtonAction (button: UIButton) {
        print("opa")
    }
}


extension DetailsFundoViewController {
    
    func setupUI() {
        
        self.view.backgroundColor = .white
        self.navigationItem.title = "Fundo"
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(simpleName)
        contentView.addSubview(dadosFundoViewLabel)
        contentView.addSubview(nameViewLabel)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(descricaoViewLabel)
        contentView.addSubview(descricaoFundoLabel)
        contentView.addSubview(dateViewLabel)
        contentView.addSubview(initialDataLabel)
        contentView.addSubview(buyButton)
        
        NSLayoutConstraint.activate([
            
            scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            simpleName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            simpleName.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            simpleName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            dadosFundoViewLabel.topAnchor.constraint(equalTo: simpleName.bottomAnchor, constant: 50),
            dadosFundoViewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dadosFundoViewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            
            nameViewLabel.topAnchor.constraint(equalTo: dadosFundoViewLabel.bottomAnchor, constant: 20),
            nameViewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameViewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            fullNameLabel.topAnchor.constraint(equalTo: nameViewLabel.bottomAnchor, constant: 20),
            fullNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            fullNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            descricaoViewLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 20),
            descricaoViewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descricaoViewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            
            descricaoFundoLabel.topAnchor.constraint(equalTo: descricaoViewLabel.bottomAnchor, constant: 20),
            descricaoFundoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descricaoFundoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            
            dateViewLabel.topAnchor.constraint(equalTo: descricaoFundoLabel.bottomAnchor, constant: 20),
            dateViewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dateViewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            
            initialDataLabel.topAnchor.constraint(equalTo: dateViewLabel.bottomAnchor, constant: 20),
            initialDataLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            initialDataLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            //initialDataLabel.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            
            buyButton.topAnchor.constraint(equalTo: initialDataLabel.bottomAnchor, constant: 20),
            buyButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            buyButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            buyButton.heightAnchor.constraint(equalToConstant: 40),
            buyButton.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: 20),
        ])
    }
}








































