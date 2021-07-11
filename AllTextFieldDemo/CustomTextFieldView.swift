//
//  CustomTextFieldView.swift
//  AllTextFieldDemo
//
//  Created by Mat on 16/03/21.
//  Copyright © 2021 Mat. All rights reserved.
//

import SwiftUI

struct CustomTextFieldView: View {
    
    @State var txtSearchText = ""
    
    var body: some View {
        
        VStack {
            // EXAMPLE 1   USING CHANGE PROTOCOLS
            
            VStack(alignment: .leading, spacing: 10) {
                Text("CUSTOM TEXT FIELD 1")
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search..." , text: $txtSearchText)
                }.textFieldStyle(OvalTextFieldStyle())
            }.padding()
                
            // EXAMPLE 2 USING MODIFIERS
            VStack(alignment: .leading, spacing: 10) {
                Text("CUSTOM TEXT FIELD 2")
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search..." , text: $txtSearchText)
                }.modifier(CustomTextFieldView1(roundCorners: 6, startColor: .orange, endColor: .purple , textColor: .white))
            }.padding()
                
            
            // EXAMPLE 3 USING EXTENTION
            VStack(alignment: .leading, spacing: 5) {
                
                Text("CUSTOM EXTENTION TEXT FIELD")
                HStack {
                    TextField("Search text... ", text: $txtSearchText)
                        .extensionTextFieldView(roundedCornes: 6, startColor: .white, endColor: .purple)
                }
            }.padding()
            
            // EXAMPLE 4
            VStack {
                Text("ILLUSION CUSTOM TEXT FIELD").foregroundColor(.neumorphictextColor)
                HStack {
                    NeumorphicStyleTextField(textField: TextField("Search...", text: $txtSearchText), imageName: "magnifyingglass")
                }
            }.padding()
            
            // EXTENTION 5
            
            VStack(alignment: .leading, spacing: 0) {
                Text("NORMAL TEXT FIELD")
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search" , text: $txtSearchText)
                }.underlineTextField()
            }
        }
    }
}

// EXAMPLE 1 EXTENTION
struct OvalTextFieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
}

// EXAMPLE 2 EXTENTION
struct CustomTextFieldView1 : ViewModifier {
    
    var roundCorners: CGFloat
    var startColor : Color
    var endColor: Color
    var textColor: Color
    
    func body(content: Content) -> some View {
        
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [ startColor, endColor ]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundCorners)
            .padding(3)
            .foregroundColor(textColor)
            .overlay(
                RoundedRectangle(cornerRadius: roundCorners)
                    .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
            .font(.custom("Open sans", size: 19))
            .shadow(radius: 10)
    }
}


// EXAMPLE 3

extension TextField {
    
    func extensionTextFieldView(roundedCornes: CGFloat, startColor: Color,  endColor: Color) -> some View {
        
        self
            .padding()
            .background( LinearGradient(gradient: Gradient(colors: [startColor , endColor]), startPoint:.topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes)
            .shadow(color: .purple, radius: 10 )
    }
}

// Example 4

struct NeumorphicStyleTextField : View   {
    
    var textField : TextField<Text>
    var imageName: String
    
    var body : some View {
        
        HStack {
            Image(systemName: imageName).foregroundColor(.darkShadow)
            textField
        }
        .padding()
        .foregroundColor(.neumorphictextColor)
        .background(Color.background)
        .cornerRadius(6)
        .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
        .shadow(color: Color.lightShadow, radius: 3, x: -2 , y: -2)
        
    }
}

// EXAMPLE 5

extension View {
    
    func underlineTextField() -> some View
    {
        self
            .padding()
            .overlay(Rectangle().frame(height: 2).padding(.top, 35))
            .foregroundColor(.darkPink)
            .padding(10)
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldView()
    }
}

extension Color {
    static let lightShadow = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    static let darkShadow = Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255)
    static let background = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
    static let neumorphictextColor = Color(red: 132 / 255, green: 132 / 255, blue: 132 / 255)
    static let darkPink = Color(red: 208 / 255, green: 45 / 255, blue: 208 / 255)

}
