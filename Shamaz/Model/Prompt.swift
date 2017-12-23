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
        moment = Time().getTime()
        sentences = future ? setFutureSentences() : setPastSentences()
        return sentences[Int(arc4random_uniform(UInt32(sentences.count)))]
    }
    
    private func setPastSentences() -> [String] {
        return [
            "What company did you work for \(moment) ago ?", "What was your dream job \(moment) ago ?",
            "Have you changed your career \(moment) ago ?", "Where did you travel \(moment) ago ?",
            "Where did you live \(moment) ago ?", "Were you an iOS developer \(moment) ago ?"
        ]
    }
    
    private func setFutureSentences() -> [String] {
        return [
            "Who would you like to meet \(moment) from now ?", "What job would you like to do in \(moment) ?",
            "Would you like to change your carreer \(moment) from now ?", "Where would you like to travel in \(moment) ?",
            "Where are you planning to live \(moment) from now ?", "Would you like to become an iOS developer in \(moment) ?"
        ]
    }
    
//    private func getSentence() -> String {
//        let max = UInt32(sentences.count)
//        let index = Int(arc4random_uniform(max))
//        return sentences[index]
//    }
}