//
//  Prompt.swift
//  Shamaz
//
//  Created by Spencer Forrest on 22/12/2017.
//  Copyright © 2017 Spencer Forrest. All rights reserved.
//

import Foundation

class Prompt {
  private var sentences: [String] = [String]()
  private var moment: String = ""
  
  func getSentence(fromFuture future: Bool = true) -> String{
    moment = RandomTime().getString()
    sentences = future ? getFutureSentences() : getPastSentences()
    return sentences[Int(arc4random_uniform(UInt32(sentences.count)))]
  }
  
  private func getPastSentences() -> [String] {
    return [
      "What company did you work for \(moment) ago ?",
      "What was your dream job \(moment) ago ?",
      "Have you changed your career \(moment) ago ?",
      "Where did you travel \(moment) ago ?",
      "Where did you live \(moment) ago ?",
      "Were you an iOS developer \(moment) ago ?"
    ]
  }
  
  private func getFutureSentences() -> [String] {
    return [
      "Who would you like to meet \(moment) from now ?",
      "What job would you like to do in \(moment) ?",
      "Would you like to change your career \(moment) from now ?",
      "Where would you like to travel in \(moment) ?",
      "Where are you planning to live \(moment) from now ?",
      "Would you like to become an iOS developer in \(moment) ?"
    ]
  }
}
