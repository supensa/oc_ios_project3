//
//  Button.swift
//  Shamaz
//
//  Created by Spencer Forrest on 18/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

/// Customed UIButton that implements an "available" state with a more aesthetic layout
class Button: UIButton {
  
  /// Available buttons can be selected and have their original color
  /// Unavailable buttons cannot be selected and are gray
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
  
  /// Round the corner of the button if desired
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
