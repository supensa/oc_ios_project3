//
//  MainViewController.swift
//  Shamaz
//
//  Created by Spencer Forrest on 18/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private var gameView = GameView()
    private var futureBtn: Button!
    private var pastBtn: Button!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(gameView)
        gameView.setupView(view: view)
        
        futureBtn = gameView.futureBtn
        pastBtn = gameView.pastBtn
        
        setActions()
    }
    
    private func setActions() {
        futureBtn.addTarget(self, action: #selector(pushFutureBtn), for: UIControlEvents.touchUpInside)
        pastBtn.addTarget(self, action: #selector(pushPastBtn), for: UIControlEvents.touchUpInside)
    }
    
    @objc private func pushFutureBtn() {
        print("You pushed your FUTURE!")
    }
    
    @objc private func pushPastBtn() {
        print("You pushed your PAST!")
    }
}
