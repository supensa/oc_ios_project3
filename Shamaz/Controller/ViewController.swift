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
  
  /// Indicate who is the next person to play
  @IBAction func nextButtonPressed() {
    showQuestionButtons()
    label.text = "\(UInt32.random(in: 1...10))"
  }
  
  /// Display a question about the future
  @IBAction func futureButtonPressed() {
    showNextButton()
    label.text = Question().getRandom()
  }
  
  /// Display a question about the past
  @IBAction func pastButtonPressed() {
    showNextButton()
    label.text = Question().getRandom(fromFuture: false)
  }
  
  /// Make question buttons unavailable and next button available
  private func showNextButton() {
    makeButtonsUnavailable(buttons: [futureButton!, pastButton!])
    nextButton.isAvailable = true
  }
  
  /// Make question buttons available and next button unavailable
  private func showQuestionButtons() {
    makeButtonsAvailable(buttons: [futureButton!, pastButton!])
    nextButton.isAvailable = false
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
