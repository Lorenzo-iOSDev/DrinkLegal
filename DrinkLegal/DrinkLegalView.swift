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
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
//                TextField("DD/MM/YYYY", text: $viewModel.birthDate)
//                    .font(.largeTitle)
//                    .onChange(of: viewModel.birthDate, perform: { value in
//                        viewModel.formatDOBString()
//                    })
//                    .multilineTextAlignment(.center)
//                    .keyboardType(.numberPad)
//                    .padding(.horizontal, 100)
                
                if (viewModel.resultIsShowing) {
                    Image(systemName: viewModel.result!.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .opacity(1.0)
                } else {
                    Text("Enter Birthdate")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding()
                }
                
                DatePicker("", selection: $viewModel.birthDate, in: Date().oneHundredYearsAgo...Date(), displayedComponents: [.date])
                    .labelsHidden()
                    .clipped()
                    .padding()
                
                Spacer()
                    .frame(maxHeight: 50)
                
                Button {
                    viewModel.compareDate()
                } label: {
                    ConfirmButton()
                }
                
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkLegalView()
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

struct ConfirmButton: View {
    
    var body: some View {
        Image(systemName: "magnifyingglass.circle")
            .imageScale(.large)
            .frame(width: 30, height: 30)
            .foregroundColor(.primary)
            .padding()
    }
}
