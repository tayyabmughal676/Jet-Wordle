//
//  Jet_WordleApp.swift
//  Jet-Wordle
//
//  Created by Thor on 20/03/2022.
//

import SwiftUI

@main
struct Jet_WordleApp: App {
    
    @StateObject var dm = WordleDataModel()
    
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
        }
        
    }
}
