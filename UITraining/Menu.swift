//
//  Menu.swift
//  UITraining
//
//  Created by Andres Gutierrez on 4/14/22.
//

import SwiftUI

struct MenuOne: View {
    @State private var showMenu         = false
    @State private var selectedAction   = ""
    
    var body: some View {
        HStack(spacing: 0){
            
            ZStack{
                // Menu
                Color.black.opacity(0.5)
                
                //Menu Content
                VStack{
                    Text("Hello User")
                        .font(.body.bold())
                        .padding(.top, 100)
                    
                    // Little Spacer
                    Rectangle().fill(.gray).frame(height: 1)
                        .shadow(radius: 1)
                    
                    // MENU!
                    Menu {
                        Button(action: { chat() }){
                            
                            Label("Chat", systemImage: "mic.circle")
                        }
                        
                        Button(action: { message() }){
                            
                            Label("Message", systemImage: "message")
                        }
                        
                        Button(action:{ phone() }){
                            
                            Label("Call", systemImage: "phone")
                        }
                        
                    } label: {
                        Image(systemName: "gear")
                    }
                    // Add Primary action to menu, making the other Views accessible only by Long-Pressing Image.
                primaryAction: {
                    phone()
                }
                    
                .padding()
                .contentShape(Rectangle())
                .background(.ultraThinMaterial, in: Circle())
                    
                    Spacer()
                }
            }
            .frame(maxWidth: showMenu ? 250 : 0, maxHeight: .infinity)
            .opacity(showMenu ? 1.0 : 0.0)
            
            VStack{
                //Content View
                HStack{
                    Button(){
                        showMenu.toggle()
                    }label: {
                        Image(systemName: "arrow.left.square.fill")
                        // Nice little effect using rotation
                            .rotationEffect(!showMenu ? Angle.degrees(-180) : Angle.degrees(0))
                    }
                    .padding(.top, 50 )
                    
                    Spacer()
                }
                
                ZStack{
                    Color.orange
                    
                    
                    VStack{
                        
                        Text("Menu Test")
                        Text("Selected Action: \(selectedAction)")
                            .font(.body)
                            .opacity(selectedAction.isEmpty ? 0.0 : 1.0)
                    }
                }
            }
            .font(.largeTitle)
        }
        .background(Rectangle().fill(Color.orange))
        .ignoresSafeArea()
        .foregroundColor(.white)
        .animation(.easeInOut, value: showMenu)
    }
    func chat() {
        selectedAction = "Chat"
    }
    func message() {
        selectedAction = "Message"
    }
    func phone() {
        selectedAction = "Phone"
    }
}// Note, you can also nest Menus




//MARK: - Another Menu Example

struct MenuTwo: View {
    @State private var showMenu = true
    
    var body: some View {
        HStack(spacing: 0){
            
            ZStack{
                // Menu
                Color.primary.opacity(showMenu ? 0.5 : 0.0)
            }
            .frame(maxWidth: showMenu ? 250 : 0, maxHeight: .infinity)
            .opacity(showMenu ? 1.0 : 0.0)
            
            VStack{
                //Content View
                HStack{
                    Button(){
                        showMenu.toggle()
                    }label: {
                        Image(systemName: showMenu ? "record.circle": "record.circle.fill")
                    }
                    .padding(.top, 50 )
                    
                    Spacer()
                }
                
                ZStack{
                    Color.orange
                    
                    
                    VStack{
                        
                        Text("Menu Test")
                    }
                }
            }
            .font(.largeTitle)
        }
        .background(Rectangle().fill(Color.orange))
        .ignoresSafeArea()
        .foregroundColor(.white)
        .animation(.easeInOut, value: showMenu)
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        MenuTwo()
    }
}
