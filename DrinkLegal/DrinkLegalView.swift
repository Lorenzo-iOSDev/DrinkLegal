//
//  ContentView.swift
//  DrinkLegal
//
//  Created by Lorenzo Zemp on 1/06/21.
//

import SwiftUI

struct DrinkLegalView: View {
    
    @StateObject var viewModel = DrinkLegalViewModel()
    
    var body: some View {
        ZStack {
            Color("BackgroundDefault")
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                TextField("DD/MM/YYYY", text: $viewModel.birthDate)
                    .font(.largeTitle)
                    .onChange(of: viewModel.birthDate, perform: { dateString in
                        viewModel.formatAndLimitDOBString(dateString)
                    })
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .padding(.horizontal, 100)
                    
                Text("Enter Birthdate")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding()
            }
        }
        .overlay(Button {
            viewModel.clearDOBString()
        } label: {
            ClearButton()
        }, alignment: .topTrailing)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkLegalView()
            .preferredColorScheme(.dark)
    }
}

struct ClearButton: View {
    
    var body: some View {
        Image(systemName: "clear")
            .imageScale(.large)
            .frame(width: 30, height: 30)
            .foregroundColor(.primary)
            .padding()
    }
}
