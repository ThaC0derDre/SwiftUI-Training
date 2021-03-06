//
//  MarkDown.swift
//  UITraining
//
//  Created by Andres Gutierrez on 5/24/22.
//

import SwiftUI

struct MarkDown: View {
    let markdownText: LocalizedStringKey = "* This is **bold** text, this is *italic* text, and this is ***bold, italic*** text."
    
    var body: some View {
        VStack(spacing: 20) {
            //Add bold with **
            Text("Be **Bold**")
            //Italics with *
            Text("*Make sure to provide your email address*")
            //Together now!
            Text("***Bold and Italic!***")
            //Create links with [] followed by (url)!
            Text("Click [Here](https://swiftlyrush.com) to view terms and conditions")
            //Together now!
            Text("Click on ***[THIS]***(https://google.com) to go to google")
            //Strike through with ~~, one or two?
            Text("~~A strikethrough example~~")
            Text("~A strikethrough example~")
            Text("`Monospaced works too`")
            
            // For properties, mark as LocalizedStringKey
            Text(markdownText)
            
        }
    }
}

struct MarkDown_Previews: PreviewProvider {
    static var previews: some View {
        MarkDown()
    }
}
