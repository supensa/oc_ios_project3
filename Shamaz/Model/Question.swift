//
//  Question.swift
//  Shamaz
//
//  Created by Spencer Forrest on 22/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import Foundation

/// Represent the question used in the game
class Question {
  private var interrogativeSentences: [String] = [String]()
  private var duration: String = ""
  
  /// Generate a random question
  ///
  /// - Parameter future: Question about the future or the past ? (future by default)
  /// - Returns: A random question as a String
  func getRandom(fromFuture future: Bool = true) -> String{
    duration = RandomTime().getString()
    interrogativeSentences = future ? getFutureSentences() : getPastSentences()
    return interrogativeSentences[Int(arc4random_uniform(UInt32(interrogativeSentences.count)))]
  }
  
  /// Generate questions about the past
  ///
  /// - Returns: Return premade questions
  private func getPastSentences() -> [String] {
    return [
      "What company did you work for \(duration) ago ?",
      "What was your dream job \(duration) ago ?",
      "Have you changed your career \(duration) ago ?",
      "Where did you travel \(duration) ago ?",
      "Where did you live \(duration) ago ?",
      "Were you an iOS developer \(duration) ago ?"
    ]
  }
  
  /// Generate questions about the future
  ///
  /// - Returns: Return premade questions
  private func getFutureSentences() -> [String] {
    return [
      "Who would you like to meet \(duration) from now ?",
      "What job would you like to do in \(duration) ?",
      "Would you like to change your career \(duration) from now ?",
      "Where would you like to travel in \(duration) ?",
      "Where are you planning to live \(duration) from now ?",
      "Would you like to become an iOS developer in \(duration) ?"
    ]
  }
}
