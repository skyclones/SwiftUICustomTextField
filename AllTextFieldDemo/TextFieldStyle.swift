//
//  TextFieldStyle.swift
//  AllTextFieldDemo
//
//  Created by Mat on 15/03/21.
//  Copyright © 2021 Mat. All rights reserved.
//

import SwiftUI

struct TextFieldStyle1: View {
    
    @State var txtFieldValue = ""
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text("Text Field Demo 1")
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search..." , text: $txtFieldValue)
            }
            .textFieldStyle(DefaultTextFieldStyle())
            
            
            Text("Text Field Demo 2")
            
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search..." , text: $txtFieldValue)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
        }.padding()
    }
}

struct TextFieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldStyle1()
    }
}
