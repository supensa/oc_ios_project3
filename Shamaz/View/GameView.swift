//
//  GameView.swift
//  Shamaz
//
//  Created by Spencer Forrest on 18/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

class GameView: UIView {
    let futureButton = Button(title: "DREAM of the Future")
    let pastButton = Button(title: "REFLECT on the past", red: 100, green: 0, blue: 0)
    let nextButton = Button(title: "Who's NEXT?", red: 0, green: 100, blue: 0)
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.text = "Welcome to the Shamaz game."
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label.backgroundColor = UIColor(r: 220, g: 220, b: 220)
        label.translatesAutoresizingMaskIntoConstraints = false
        
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
    
    convenience init(view v: UIView) {
        self.init(frame: v.frame)
        v.addSubview(self)
        setupGameViewConstraint(view: v)
    }
    
    override init(frame f: CGRect) {
        super.init(frame: f)
        
        backgroundColor = UIColor.white
        nextButton.isAvailable = false
        
        buttonStackView.addArrangedSubview(futureButton)
        buttonStackView.addArrangedSubview(pastButton)
        
        mainStackView.addArrangedSubview(buttonStackView)
        mainStackView.addArrangedSubview(label)
        mainStackView.addArrangedSubview(nextButton)
        
        self.addSubview(mainStackView)
        
        setupMainStackViewLayout()
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupGameViewConstraint(view v: UIView) {
        topAnchor.constraint(equalTo: v.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: v.bottomAnchor).isActive = true
        leftAnchor.constraint(equalTo: v.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: v.rightAnchor).isActive = true
    }
    
    private func setupMainStackViewLayout() {
        setupButtonStackViewLayout()
        setupLabelLayout()
        mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        mainStackView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -24).isActive = true
    }
    
    private func setupButtonStackViewLayout() {
        buttonStackView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor).isActive = true
    }
    
    private func setupLabelLayout() {
        label.widthAnchor.constraint(equalTo: mainStackView.widthAnchor).isActive = true
    }
    
    func showNextButton() {
        unvisibleButtons(buttons: [futureButton, pastButton])
        nextButton.isAvailable = true
    }
    
    func showStoryButton() {
        visibleButtons(buttons: [futureButton, pastButton])
        nextButton.isAvailable = false
    }
    
    private func unvisibleButtons(buttons: [Button]) {
        for button in buttons {
            button.isAvailable = false
        }
    }
    
    private func visibleButtons(buttons: [Button]) {
        for button in buttons {
            button.isAvailable = true
        }
    }
}

extension UIColor {
    convenience init(r:CGFloat, g:CGFloat, b:CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
