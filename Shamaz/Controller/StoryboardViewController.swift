//
//  StoryboardViewController.swift
//  Shamaz
//
//  Created by Spencer Forrest on 23/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

class StoryboardViewController: UIViewController {

    @IBOutlet weak var futureBtn: StoryboardButton!
    @IBOutlet weak var pastBtn: StoryboardButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var nextBtn: StoryboardButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressednextBtn() {
        showStoryBtn()
        label.text = "\(arc4random_uniform(UInt32(10)) + 1)"
    }
    
    @IBAction func pressedFutureBtn() {
        showNextBtn()
        label.text = Prompt().getSentence()
    }
    
    @IBAction func pressedPastBtn() {
        showNextBtn()
        label.text = Prompt().getSentence(fromFuture: false)
    }
    
    private func showNextBtn() {
        unvisibleButtons(buttons: [futureBtn!, pastBtn!])
        nextBtn.isAvailable = true
    }
    
    private func showStoryBtn() {
        visibleButtons(buttons: [futureBtn!, pastBtn!])
        nextBtn.isAvailable = false
    }
    
    private func unvisibleButtons(buttons: [StoryboardButton]) {
        for button in buttons {
            button.isAvailable = false
        }
    }
    
    private func visibleButtons(buttons: [StoryboardButton]) {
        for button in buttons {
            button.isAvailable = true
        }
    }
}
