//
//  Modifiers.swift
//  UITraining
//
//  Created by Andres Gutierrez on 11/4/22.
//

import SwiftUI

struct AnimatableFrame: ViewModifier, Animatable {
    
    var height: CGFloat
    var animatableData: CGFloat {
        get { height }
        set { height = newValue }
    }
    
    func body(content: Content) -> some View {
        content.frame(height: height, alignment: .top)
    }
}
