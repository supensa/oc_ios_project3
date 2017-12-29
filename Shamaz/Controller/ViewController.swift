//
//  StoryboardViewController.swift
//  Shamaz
//
//  Created by Spencer Forrest on 23/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var futureButton: Button!
  @IBOutlet weak var pastButton: Button!
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var nextButton: Button!
  
  @IBAction func nextButtonPressed() {
    showStoryButtons()
    label.text = "\(arc4random_uniform(UInt32(10)) + 1)"
  }
  
  @IBAction func futureButtonPressed() {
    showNextButton()
    label.text = Prompt().getSentence()
  }
  
  @IBAction func pastButtonPressed() {
    showNextButton()
    label.text = Prompt().getSentence(fromFuture: false)
  }
  
  private func showNextButton() {
    makeButtonsUnavailable(buttons: [futureButton!, pastButton!])
    nextButton.isAvailable = true
  }
  
  private func showStoryButtons() {
    makeButtonsAvailable(buttons: [futureButton!, pastButton!])
    nextButton.isAvailable = false
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
