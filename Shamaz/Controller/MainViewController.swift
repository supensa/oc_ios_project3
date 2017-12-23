//
//  MainViewController.swift
//  Shamaz
//
//  Created by Spencer Forrest on 18/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private weak var gameView: GameView!
    private weak var futureBtn: Button!
    private weak var pastBtn: Button!
    private weak var nextBtn: Button!
    private weak var label: UILabel!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameView = GameView(view: view)
        
        futureBtn = gameView.futureBtn
        pastBtn = gameView.pastBtn
        label = gameView.label
        nextBtn = gameView.nextBtn
        
        setActions()
    }
    
    private func setActions() {
        futureBtn.addTarget(self, action: #selector(pressedFutureBtn), for: UIControlEvents.touchUpInside)
        pastBtn.addTarget(self, action: #selector(pressedPastBtn), for: UIControlEvents.touchUpInside)
        nextBtn.addTarget(self, action: #selector(pressednextBtn), for: UIControlEvents.touchUpInside)
    }
    
    @objc private func pressednextBtn() {
        gameView.showStoryBtn()
        label.text = "\(arc4random_uniform(UInt32(10)) + 1)"
    }
    
    @objc private func pressedFutureBtn() {
        gameView.showNextBtn()
        label.text = Prompt().getSentence()
    }
    
    @objc private func pressedPastBtn() {
        gameView.showNextBtn()
        label.text = Prompt().getSentence(fromFuture: false)
    }
}
