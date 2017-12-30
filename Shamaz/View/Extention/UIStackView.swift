//
//  UIStackView.swift
//  Shamaz
//
//  Created by Spencer Forrest on 30/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

extension UIStackView {
  func addArrangedSubviews(_ views: [UIView]) {
    for view in views {
      self.addArrangedSubview(view)
    }
  }
}
