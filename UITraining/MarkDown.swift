//
//  MarkDown.swift
//  UITraining
//
//  Created by Andres Gutierrez on 5/24/22.
//

import SwiftUI

struct MarkDown: View {
    var body: some View {
        VStack {
            //Add bold with **
            Text("**Login**")
            //Italics with *
            Text("*Make sure to provide your email address*")
            //Create links with [] followed by (url)!
            Text("Click [Here](https://swiftlyrush.com) to view terms and conditions")
        }
    }
}

struct MarkDown_Previews: PreviewProvider {
    static var previews: some View {
        MarkDown()
    }
}
