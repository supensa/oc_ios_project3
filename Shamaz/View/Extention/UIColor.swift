//
//  UIColor.swift
//  Shamaz
//
//  Created by Spencer Forrest on 30/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

extension UIColor {
  convenience init(red r: CGFloat, green g: CGFloat, blue b: CGFloat) {
    self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
  }
}
