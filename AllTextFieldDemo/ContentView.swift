//
//  ContentView.swift
//  AllTextFieldDemo
//
//  Created by Mat on 15/03/21.
//  Copyright © 2021 Mat. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        NavigationView {
            VStack (alignment: .center, spacing: 10) {
                NavigationLink(destination: TextFieldStyle1()) {
                    Text("Simplete Text field")
                }
                NavigationLink(destination: CustomTextFieldView()) {
                    Text("Custom Text field Style")
                }
                NavigationLink(destination: TextFieldStyle1()) {
                    Text("Using Button Style")
                }
            }
            .navigationBarTitle( Text("All Buttons") , displayMode:.inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
