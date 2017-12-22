//
//  MainViewController.swift
//  Shamaz
//
//  Created by Spencer Forrest on 18/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var gameView: GameView!
    private var futureBtn: Button!
    private var pastBtn: Button!
    private var nextBtn: Button!
    private var label: UILabel!
    
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
//        print("You pushed to the NEXT!")
        gameView.showStoryBtn()
        label.text = "\(arc4random_uniform(UInt32(10)) + 1)"
    }
    
    @objc private func pressedFutureBtn() {
//        print("You pushed your FUTURE!")
        gameView.showNextBtn()
        label.text = Prompt().getSentence()
    }
    
    @objc private func pressedPastBtn() {
//        print("You pushed your PAST!")
        gameView.showNextBtn()
        label.text = Prompt().getSentence(fromFuture: false)
    }
}
