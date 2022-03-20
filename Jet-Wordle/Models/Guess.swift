//
//  Guess.swift
//  Jet-Wordle
//
//  Created by Thor on 20/03/2022.
//

import Foundation
import SwiftUI


struct Guess {
    let index: Int
    var word = "     "
    var bgColors = [Color](repeating: .systemBackground, count: 5)
    var cardFlipped = [Bool](repeating: false, count: 5)
    var guessLetters: [String] {
        word.map { String($0) }
    }
    
}
