//
//  Button.swift
//  Shamaz
//
//  Created by Spencer Forrest on 18/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

class Button: UIButton {
    
    var isVisible: Bool! {
        didSet {
            if isVisible {
                self.backgroundColor = defaultColor
                self.isEnabled = true
            } else {
                self.backgroundColor = UIColor.lightGray
                self.isEnabled = false
            }
        }
    }
    
    private var defaultColor: UIColor!
    
    convenience init(title text: String, red r: CGFloat = 0, green g: CGFloat = 0, blue b: CGFloat = 100, alpha a: CGFloat = 1) {
        self.init()
        self.isVisible = true
        self.defaultColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
        self.backgroundColor = defaultColor
        self.setTitle(text, for: UIControlState.normal)
        self.setTitleColor(UIColor.white, for: UIControlState.normal)
        self.layer.cornerRadius = 5
    }
}
