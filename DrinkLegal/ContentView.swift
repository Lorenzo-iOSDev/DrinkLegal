//
//  ContentView.swift
//  DrinkLegal
//
//  Created by Lorenzo Zemp on 1/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var birthDate = ""
    let characterLimit = 10
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                TextField("DD/MM/YYYY", text: $birthDate)
                    .font(.largeTitle)
                    .onChange(of: birthDate, perform: { dateString in
                        print("Text field count is: \(dateString.count)")
                        
                        if dateString.count == 2 || dateString.count == 5 {
                            birthDate.append("/")
                        } else if dateString.count > characterLimit {
                            birthDate = String(birthDate.prefix(characterLimit))
                        }
                    })
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
