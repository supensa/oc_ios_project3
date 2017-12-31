//
//  ViewController.swift
//  Shamaz
//
//  Created by Spencer Forrest on 18/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private weak var gameView: GameView!
  private weak var futureButton: Button!
  private weak var pastButton: Button!
  private weak var nextButton: Button!
  private weak var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    gameView = GameView(view: view)
    
    futureButton = gameView.futureButton
    pastButton = gameView.pastButton
    label = gameView.label
    nextButton = gameView.nextButton
    
    setupActions()
  }
  
  /// Setup actions with corresponding buttons and events
  private func setupActions() {
    futureButton.addTarget(self, action: #selector(futureButtonPressed), for: UIControlEvents.touchUpInside)
    pastButton.addTarget(self, action: #selector(pastButtonPressed), for: UIControlEvents.touchUpInside)
    nextButton.addTarget(self, action: #selector(nextButtonPressed), for: UIControlEvents.touchUpInside)
  }
  
  /// Indicate who is the next person to play
  @objc private func nextButtonPressed() {
    gameView.showQuestionButtons()
    label.text = "\(arc4random_uniform(UInt32(10)) + 1)"
  }
  
  /// Display a question about the future
  @objc private func futureButtonPressed() {
    gameView.showNextButton()
    label.text = Question().getRandom()
  }
  
  /// Display a question about the past
  @objc private func pastButtonPressed() {
    gameView.showNextButton()
    label.text = Question().getRandom(fromFuture: false)
  }
}
