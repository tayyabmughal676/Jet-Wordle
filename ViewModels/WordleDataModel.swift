//
//  WordleDataModel.swift
//  Jet-Wordle
//
//  Created by Thor on 20/03/2022.
//

import Foundation
import SwiftUI

class WordleDataModel: ObservableObject{
    
    @Published var guesses: [Guess] = []
    @Published var incorrectAttempts =  [Int](repeating: 0, count: 6)
    
    var keyColors = [String: Color]()
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var inPlay = false
    
    
    var gameStarted: Bool {
        !currentWord.isEmpty || tryIndex > 0
    }
    
    var disableKeys: Bool {
        !inPlay || currentWord.count == 5
    }
    
    
    init(){
        newGame()
    }
    
    //    MARK: - Setup
    func newGame(){
        populateDefaults()
        selectedWord = Global.commonWords.randomElement()!
        currentWord = ""
        print("selectedWord \(selectedWord)")
        inPlay = true
    }
    
    func populateDefaults(){
        guesses = []
        for index in 0...5 {
            guesses.append(Guess(index: index))
        }
        
        //        reset keyboard colors
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWYZ"
        for char in letters {
            keyColors[String(char)] = .unused
        }
    }
    
    //    MARK: - Game Play
    func addToCurrentWorld(_ letter: String){
        print("addToCurrentWorld: \(letter)")
        currentWord += letter
        updateRow()
    }
    
    func enterWord(){
        if verifyWord(){
            print("enterWord: Valid Word")
        }else{
            withAnimation {
                self.incorrectAttempts[tryIndex] += 1
            }
            
            incorrectAttempts[tryIndex] = 0
        }
    }
    
    func removeLetterFromCurrentWord(){
        currentWord.removeLast()
        updateRow()
    }
    
    func updateRow(){
        let guessWord = currentWord.padding(toLength: 5, withPad: " ", startingAt: 0)
        guesses[tryIndex].word = guessWord
    }
    
    func verifyWord() -> Bool {
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)
    }
    
    
}
