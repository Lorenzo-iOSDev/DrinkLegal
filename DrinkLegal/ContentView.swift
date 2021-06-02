//
//  ContentView.swift
//  DrinkLegal
//
//  Created by Lorenzo Zemp on 1/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var birthDate = ""
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                TextField("DD/MM/YYYY", text: $birthDate)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numbersAndPunctuation)
                    .padding(.horizontal, 100)
                
                Text("Enter Birthdate")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding()
                
                
            }
        }
        .overlay(Image(systemName: "arrow.uturn.backward.circle")
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
                    .padding(),
                 alignment: .topTrailing)
    }
    
    func checkTextFieldLength() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
