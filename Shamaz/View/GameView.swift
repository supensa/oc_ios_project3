//
//  GameView.swift
//  Shamaz
//
//  Created by Spencer Forrest on 18/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

class GameView: UIView {
    
    let futureBtn = Button(title: "Future")
    let pastBtn = Button(title: "Past", red: 100, green: 0, blue: 0)
    let nextBtn = Button(title: "Next", red: 0, green: 100, blue: 0)
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "TEST !!!!"
        
        return label
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame f: CGRect) {
        super.init(frame: f)
        
        backgroundColor = UIColor.white
        
        buttonStackView.addArrangedSubview(futureBtn)
        buttonStackView.addArrangedSubview(pastBtn)
        
        mainStackView.addArrangedSubview(buttonStackView)
        mainStackView.addArrangedSubview(label)
        mainStackView.addArrangedSubview(nextBtn)
        
        self.addSubview(mainStackView)
        
        setupMainStackViewLayout()
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupView(view: UIView){
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func setupMainStackViewLayout(){
        setupButtonStackViewLayout()
        setupLabelLayout()
        mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        mainStackView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -24).isActive = true
    }
    
    private func setupButtonStackViewLayout(){
        buttonStackView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor).isActive = true
    }
    
    private func setupLabelLayout(){
        label.widthAnchor.constraint(equalTo: mainStackView.widthAnchor).isActive = true
        label.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
    }
}
