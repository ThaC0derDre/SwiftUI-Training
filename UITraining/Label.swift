//
//  Label.swift
//  UITraining
//
//  Created by Andres Gutierrez on 4/12/22.
//

import SwiftUI


struct TheLabel: View {
    
    @State private var stepAmount = 1
    var body: some View {
        
        VStack{
            //MARK: - The Basic Use
            Label("Amazing", systemImage: "star.fill")
            
            
            //MARK: - Button With Label
            Button(role: .destructive) {
              //stop()
            } label: {
              Label("Stop", systemImage: "xmark.circle")
                .font(.title3)
                .padding(.horizontal)
            }
            .buttonStyle(.borderedProminent)

            
            //MARK: - For More control over 'title' and 'icon'
            Label {
                Text("Spectacular")
                    .font(.largeTitle.lowercaseSmallCaps())
            } icon: {
                Image(systemName: "star")
                    .rotationEffect(.degrees(-30))
            }
            
            
            //MARK: - Using Image Asset instead of SF Symbol
            Label {
                Text("FIERCE")
            } icon: {
                Image("dragon")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            }
            
            
            // Use Button for icon. Can create stepper effect
            
            Label{
                Text("\(stepAmount)")
            } icon: {
                Button("\(Image(systemName: "play"))"){
                    stepAmount += 1
                }
            }
            VStack{
                //MARK: - Using labelStyle to show/hide components
                
                Label("LOVE", systemImage: "heart")
                    .labelStyle(.iconOnly)
                Label("LOVE", systemImage: "heart")
                    .labelStyle(.titleAndIcon)
                Label("LOVE", systemImage: "heart")
                    .labelStyle(.titleOnly)
                Label("LOVE", systemImage: "heart")
                    .labelStyle(.automatic)
            }
            .frame(width: 100, height: 100)
            .background(.indigo.opacity(0.3))
        }
        
    }
}


//MARK: - Labels in List
struct LabelsInList: View{
    var body: some View{
        // Fake Label
        List{
            Text("Rules of Coding")
                .font(.largeTitle)
            HStack{
                Image(systemName: "person.3")
                Divider()
                Text("Build Community")
            }
            
            HStack{
                Image(systemName: "square.and.pencil")
                Divider()
                Text("Create and Create")
            }
            //Notice not aligned. Use "Label" instead of "HStack"
        }
        
        
        List{
            Text("Rules of Coding")
                .font(.largeTitle)
            Label{
                Text("Build Community")
            } icon: {
                Image(systemName: "person.3")
                    .foregroundColor(.primary)
            }
            Label{
                Text("Create and Create")
            } icon: {
                Image(systemName: "square.and.pencil")
                    .foregroundColor(.primary)
            }
        }
    }
}


//MARK: - Creating Custom LabelStyle
// Protocol requires 'makeBody' func.
struct CustomLabelStyle: LabelStyle {
    let iconColor: Color
    let titlecolor: Color
    let backgroundColor: Color
    let opaque: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.icon
                .foregroundColor(iconColor)
            
            
            configuration.title
                .foregroundColor(titlecolor)
                .padding(.horizontal, 10)
                .lineLimit(1)
                .border(Color.black)
            
            configuration.icon
                .foregroundColor(iconColor)
            //Flipping the icon Vertically: 'y axis'
                .rotation3DEffect(.degrees(180), axis: (x: 0.0, y: 1.0, z: 0.0))
            
            
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 10).fill(backgroundColor.opacity(opaque ? 1 : 0.2)))
    }
}


//MARK: - Another Custom Style
struct BlueDashBorderLabel: LabelStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        Label(configuration)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(.blue, style: StrokeStyle(lineWidth: 2, dash: [4,4]))
            )
    }
}


//MARK: - CustomLabels
struct CustomLabels: View {
    var body: some View{
        VStack{
        Label("Rain", systemImage: "cloud.rain")
            .labelStyle(BlueDashBorderLabel())
            .foregroundColor(.blue)
        
        Label{
            Text("RAGE")
        } icon: {
            //image from Assets
            Image("dragon")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
        }
        .labelStyle(CustomLabelStyle(iconColor: .green, titlecolor: .red, backgroundColor: Color("greyish"), opaque: true))
        
        //or as..
        Label("PLAY", systemImage: "backward")
            .labelStyle(CustomLabelStyle(iconColor: .blue, titlecolor: .purple, backgroundColor: .teal, opaque: false))
    }
    }
}


//MARK: - Label Plug and Play
struct DifLabel: View {
    struct Person {
        let fullName: String
        let title: String
        let profileColor: Color
        let initials: String
    }
    
    let person = Person(fullName: "Dre Gucci", title: "iOS Dev", profileColor: Color(.blue), initials: "D.G")
    var body: some View{
        Label {
            Text(person.fullName)
                .font(.body)
                .foregroundColor(.primary)
            Text(person.title)
                .font(.subheadline)
                .foregroundColor(.secondary)
        } icon: {
            Circle()
                .fill(person.profileColor.opacity(0.5))
                .frame(width: 44, height: 44, alignment: .center)
                .overlay(Text(person.initials))
        }
    }
}


struct TheLabel_Previews: PreviewProvider {
    static var previews: some View {
//        LabelsInList()
        ScrollView{
            VStack{
                
                TheLabel()
                CustomLabels()
                DifLabel()
                    
            }
        }
    }
}
