//
//  RandomTime.swift
//  Shamaz
//
//  Created by Spencer Forrest on 22/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import Foundation

class RandomTime {
  
  func getString() -> String {
    let randomChoice = Int(arc4random_uniform(4)) + 1
    switch randomChoice {
    case 1:
      return getString(unit: "day", limitTime: NUMBER_MAX_DAYS)
    case 2:
      return getString(unit: "week", limitTime: NUMBER_MAX_WEEKS)
    case 3:
      return getString(unit: "month", limitTime: NUMBER_MAX_MONTHS)
    default:
      return getString(unit: "year", limitTime: NUMBER_MAX_YEARS)
    }
  }
  
  private func getString(unit: String, limitTime max: UInt32) -> String {
    let randomTime = Int(arc4random_uniform(max)) + 1
    return randomTime == 1 ? "a \(unit)" : "\(randomTime) \(unit)s"
  }
}
