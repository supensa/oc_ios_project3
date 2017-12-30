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
  
  private func setupActions() {
    futureButton.addTarget(self, action: #selector(futureButtonPressed), for: UIControlEvents.touchUpInside)
    pastButton.addTarget(self, action: #selector(pastButtonPressed), for: UIControlEvents.touchUpInside)
    nextButton.addTarget(self, action: #selector(nextButtonPressed), for: UIControlEvents.touchUpInside)
  }
  
  @objc private func nextButtonPressed() {
    gameView.showStoryButton()
    label.text = "\(arc4random_uniform(UInt32(10)) + 1)"
  }
  
  @objc private func futureButtonPressed() {
    gameView.showNextButton()
    label.text = Prompt().getSentence()
  }
  
  @objc private func pastButtonPressed() {
    gameView.showNextButton()
    label.text = Prompt().getSentence(fromFuture: false)
  }
}
