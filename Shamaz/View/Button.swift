//
//  Button.swift
//  Shamaz
//
//  Created by Spencer Forrest on 18/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

class Button: UIButton {
  
  var isAvailable: Bool! {
    didSet {
      if isAvailable {
        self.backgroundColor = defaultColor
        self.isEnabled = true
      } else {
        self.backgroundColor = UIColor.lightGray
        self.isEnabled = false
      }
    }
  }
  
  private var defaultColor: UIColor!
  
  convenience init(title text: String, color: UIColor) {
    self.init()
    self.isAvailable = true
    self.defaultColor = color
    self.backgroundColor = defaultColor
    self.setTitle(text, for: UIControlState.normal)
    self.setTitleColor(UIColor.white, for: UIControlState.normal)
    self.layer.cornerRadius = 5
  }
}
