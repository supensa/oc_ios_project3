//
//  RandomTime.swift
//  Shamaz
//
//  Created by Spencer Forrest on 22/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

/// An Object that provides a random duration
class RandomTime {
  
  /// Generate a random duration.
  /// Example: "a year" or "5 days"
  ///
  /// - Returns: String representing the duration
  func getString() -> String {
    
    let randomChoice = Int.random(in: 1...4)
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
  
  private func getString(unit: String, limitTime max: Int) -> String {
    let randomTime = Int.random(in: 1...max)
    return randomTime == 1 ? "a \(unit)" : "\(randomTime) \(unit)s"
  }
}
