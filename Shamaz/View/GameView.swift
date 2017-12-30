//
//  GameView.swift
//  Shamaz
//
//  Created by Spencer Forrest on 18/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

class GameView: UIView {
  
  let futureButton = Button(title: "DREAM of the Future", color: FUTURE_BUTTON_BACKGROUND_COLOR)
  let pastButton = Button(title: "REFLECT on the past", color: PAST_BUTTON_BACKGROUND_COLOR)
  let nextButton = Button(title: "Who's NEXT?", color: NEXT_BUTTON_BACKGROUND_COLOR)
  
  let label: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.numberOfLines = 0
    label.textColor = UIColor.black
    label.text = "Welcome to the Shamaz game."
    label.backgroundColor = CLEAR_GRAY_BACKGROUND_COLOR
    return label
  }()
  
  convenience init(view v: UIView) {
    self.init(frame: v.frame)
    setupGameView(view: v)
  }
  
  func showNextButton() {
    makeButtonsUnavailable(buttons: [futureButton, pastButton])
    nextButton.isAvailable = true
  }
  
  func showStoryButton() {
    makeButtonsAvailable(buttons: [futureButton, pastButton])
    nextButton.isAvailable = false
  }
  
  private let buttonStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.spacing = 10
    return stackView
  }()
  
  private let mainStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.spacing = 10
    return stackView
  }()
  
  private func setupGameView(view v: UIView) {
    backgroundColor = UIColor.white
    nextButton.isAvailable = false
    
    buttonStackView.addArrangedSubviews([futureButton, pastButton])
    mainStackView.addArrangedSubviews([buttonStackView, label, nextButton])
    self.addSubview(mainStackView)
    v.addSubview(self)
    
    setupConstraints(view: v)
  }
  
  private func setupConstraints(view v: UIView) {
    setupGameViewConstraints(view: v)
    setupButtonStackViewConstraints()
    setupLabelConstraints()
    setupMainStackViewConstraints()
  }
  
  private func setupGameViewConstraints(view v: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo: v.topAnchor).isActive = true
    bottomAnchor.constraint(equalTo: v.bottomAnchor).isActive = true
    leftAnchor.constraint(equalTo: v.leftAnchor).isActive = true
    rightAnchor.constraint(equalTo: v.rightAnchor).isActive = true
  }
  
  private func setupButtonStackViewConstraints() {
    buttonStackView.translatesAutoresizingMaskIntoConstraints = false
    buttonStackView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor).isActive = true
  }
  
  private func setupLabelConstraints() {
    label.translatesAutoresizingMaskIntoConstraints = false
    label.heightAnchor.constraint(equalToConstant: 50).isActive = true
    label.widthAnchor.constraint(equalTo: mainStackView.widthAnchor).isActive = true
  }
  
  private func setupMainStackViewConstraints() {
    mainStackView.translatesAutoresizingMaskIntoConstraints = false
    mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    mainStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    mainStackView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -24).isActive = true
  }
  
  private func makeButtonsUnavailable(buttons: [Button]) {
    for button in buttons {
      button.isAvailable = false
    }
  }
  
  private func makeButtonsAvailable(buttons: [Button]) {
    for button in buttons {
      button.isAvailable = true
    }
  }
}
