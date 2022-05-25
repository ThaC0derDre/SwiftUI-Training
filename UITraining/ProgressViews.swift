//
//  ProgressViews.swift
//  UITraining
//
//  Created by Andres Gutierrez on 5/24/22.
//

import SwiftUI

struct ProgressViews: View {
    var body: some View {
        VStack{
            ProgressView()
            ProgressView("Loading...")
            ProgressView(value: 1, total: 10)
            // Adds a percentage
            ProgressView(value: 2, total: 10) {
                Text("Loading")
            } currentValueLabel: {
                Text("20%")
            }

        }
    }
}

struct ProgressViews_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViews()
    }
}
