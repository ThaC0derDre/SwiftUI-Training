//
//  MatchGeometryEffect.swift
//  UITraining
//
//  Created by Andres Gutierrez on 11/3/22.
//

import SwiftUI

struct MatchedGeoModel: Identifiable{
    let id = UUID().uuidString
    let name: String
    let company: String
    let title: String
    let bio: String
    let phoneNumber: String
    let email: String?
    
    
    static let samples = [
        MatchedGeoModel(name: "Andrés Gutierrez", company: "N/A", title: "iOS Developer", bio: "Self-taught Dev. After a year of learning UIKit and SwiftUI, I immediately began woring on projects for public safety departments within Yamaava Casino", phoneNumber: "7604443333", email: nil),
        MatchedGeoModel(name: "Sam Guy", company: "Twitter", title: "Reseach Analyst", bio: "I get off on reseaching things. It's.. kind of my thing", phoneNumber: "7609876542", email: "lilBoPeep@gmail.com"),
        MatchedGeoModel(name: "Hillary Gwen", company: "Records", title: "Artist", bio: "I've been singing for years. It's..kind of my thing",phoneNumber: "7602137654", email: "howamiidonigthis@gmail.com"),
        MatchedGeoModel(name: "Shy Guy", company: "Secret", title: "Semi-pro Gamer", bio: "Look man, please just leave me alone. I'm afraid of this convo",phoneNumber: "7609898342", email: "heresmyemail@jackdorsey.com"),
        MatchedGeoModel(name: "Johnny Jack", company: "FirstName Game", title: "Professional Namer", bio: "I like to name things. My idol is Adam, as in Adam and Eve", phoneNumber: "7604937857", email: nil)
    ]
    
}

struct MatchGeometryEffect: View {
    
    private var imageName = "HeadshotPhoto"
    @Namespace private var profileView
    @State private var allEmployees = MatchedGeoModel.samples
    @State private var selectedEmployee: MatchedGeoModel? = nil
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(allEmployees) {
                    ProfileCells(imageName: imageName, employee: $0, selectedEmployee: $selectedEmployee)
                        
                        
                }
            }
            .refreshable {
                allEmployees.shuffle()
            }
            
            .navigationTitle("Staff")
        }
    }
}

struct MatchGeometryEffect_Previews: PreviewProvider {
    static var previews: some View {
        MatchGeometryEffect()
    }
}

extension MatchGeometryEffect{
}
