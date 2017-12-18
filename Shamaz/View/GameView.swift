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
    let pastBtn = Button(title: "Past", red: 255, green: 0, blue: 0)
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame f: CGRect) {
        super.init(frame: f)
        
        backgroundColor = UIColor.white
        
        horizontalStackView.addArrangedSubview(futureBtn)
        horizontalStackView.addArrangedSubview(pastBtn)
        
        self.addSubview(horizontalStackView)
        
        setupHorizontalStackView()
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupView(view: UIView){
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func setupHorizontalStackView(){
        horizontalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        horizontalStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        horizontalStackView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -24).isActive = true
    }
}
