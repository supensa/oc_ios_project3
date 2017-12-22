//
//  Time.swift
//  Shamaz
//
//  Created by Spencer Forrest on 22/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import Foundation

class Time {
    func getTime() -> String {
        let randomChoice = Int(arc4random_uniform(4)) + 1
        switch randomChoice {
        case 1:
            return getTime(unit: "day", limitTime: 6)
        case 2:
            return getTime(unit: "week", limitTime: 3)
        case 3:
            return getTime(unit: "month", limitTime: 11)
        default:
            return getTime(unit: "year", limitTime: 10)
        }
    }
    
    private func getTime(unit: String, limitTime max: UInt32) -> String {
        let randomTime = Int(arc4random_uniform(max)) + 1
        return randomTime == 1 ? "a \(unit)" : "\(randomTime) \(unit)s"
    }
}
