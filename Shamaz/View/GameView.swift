//
//  GameView.swift
//  Shamaz
//
//  Created by Spencer Forrest on 18/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

/// Object representing the main view of the game
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
  
  /// Make question buttons unavailable and next button available
  func showNextButton() {
    makeButtonsUnavailable(buttons: [futureButton, pastButton])
    nextButton.isAvailable = true
  }
  
  /// Make question buttons available and next button unavailable
  func showQuestionButtons() {
    makeButtonsAvailable(buttons: [futureButton, pastButton])
    nextButton.isAvailable = false
  }
  
  /// Stack view used to layout the "question buttons"
  private let buttonStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.spacing = 10
    return stackView
  }()
  
  /// Stack view used to layout the whole (buttons and label)
  private let mainStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.spacing = 10
    return stackView
  }()
  
  /// Setup the main view of the game
  ///
  /// - Parameter view: Controller's default view
  private func setupGameView(view: UIView) {
    backgroundColor = UIColor.white
    nextButton.isAvailable = false
    
    buttonStackView.addArrangedSubviews([futureButton, pastButton])
    mainStackView.addArrangedSubviews([buttonStackView, label, nextButton])
    self.addSubview(mainStackView)
    view.addSubview(self)
    
    setupConstraints(view: view)
  }
  
  /// Setup all the constraints for all the views
  ///
  /// - Parameter view: Controller's default view
  private func setupConstraints(view: UIView) {
    setupGameViewConstraints(view: view)
    setupButtonStackViewConstraints()
    setupLabelConstraints()
    setupMainStackViewConstraints()
  }
  
  private func setupGameViewConstraints(view: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
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
  
  /// Buttons that should become unavailable
  ///
  /// - Parameter buttons: Array of "Buttons".
  private func makeButtonsUnavailable(buttons: [Button]) {
    for button in buttons {
      button.isAvailable = false
    }
  }
  
  /// Buttons that should become available
  ///
  /// - Parameter buttons: Array of "Buttons".
  private func makeButtonsAvailable(buttons: [Button]) {
    for button in buttons {
      button.isAvailable = true
    }
  }
}
