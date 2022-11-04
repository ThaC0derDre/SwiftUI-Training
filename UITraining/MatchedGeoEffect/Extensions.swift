//
//  Extensions.swift
//  UITraining
//
//  Created by Andres Gutierrez on 11/4/22.
//

import SwiftUI

extension View {
    func animatableFrame(height: CGFloat) -> some View {
        modifier(AnimatableFrame(height: height))
    }
}
