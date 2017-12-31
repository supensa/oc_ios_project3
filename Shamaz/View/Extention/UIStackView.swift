//
//  UIStackView.swift
//  Shamaz
//
//  Created by Spencer Forrest on 30/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import UIKit

extension UIStackView {
  /// Adds views to the end of the arrangedSubviews array (Order in array does matter).
  /// The stack view ensures that the arrangedSubviews array is always a subset of its subviews array.
  /// This method automatically adds the provided views as subviews of the stack view, if it is not already.
  /// If the views are already subviews, this operation does not alter the subviews ordering.
  ///
  /// - Parameter views: The views to be added to the array of views arranged by the stack.
  func addArrangedSubviews(_ views: [UIView]) {
    for view in views {
      self.addArrangedSubview(view)
    }
  }
}
