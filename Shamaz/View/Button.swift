//
//  IBButton.swift
//  Shamaz
//
//  Created by Spencer Forrest on 23/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

@IBDesignable
/// Button that implements a "available" state and some aesthetic
class Button: UIButton {
  
  /// Available buttons can be selected and have their original color
  /// Unavailable buttons cannot be selected and are gray
  @IBInspectable var isAvailable: Bool = true {
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
  
  @IBInspectable private var defaultColor: UIColor = UIColor.blue
  
  /// Round the corner of the button if desired
  @IBInspectable private var cornerRadius: CGFloat = 5 {
    didSet {
      self.layer.cornerRadius = cornerRadius
    }
  }
}
