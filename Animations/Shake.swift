//
//  Shake.swift
//  Jet-Wordle
//
//  Created by Thor on 20/03/2022.
//

import SwiftUI

struct Shake: GeometryEffect {
    
    var amount : CGFloat = 10
    var shakePerUnit = 3
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform{
        ProjectionTransform(CGAffineTransform(translationX: amount * sin(animatableData * .pi  * CGFloat(shakePerUnit)), y: 0))
    }
}

