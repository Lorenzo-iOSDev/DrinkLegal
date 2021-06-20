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
                
                HStack(alignment: .center) {
                    TextField("DD", text: $viewModel.birthDay)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .frame(width: 65)
                        .onChange(of: viewModel.birthDay, perform: { value in
                            viewModel.formatDOBString(dateType: .Day)
                        })
                    
                    Text("/")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    
                    TextField("MM", text: $viewModel.birthMonth)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .frame(width: 65)
                        .onChange(of: viewModel.birthMonth, perform: { value in
                            viewModel.formatDOBString(dateType: .Month)
                        })
                    
                    Text("/")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    
                    TextField("YYYY", text: $viewModel.birthYear)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .frame(width: 100)
                        .onChange(of: viewModel.birthYear, perform: { value in
                            viewModel.formatDOBString(dateType: .Year)
                        })
                }
                    
                Text("Enter Birthdate")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding()
                
                Button {
                    viewModel.validDateCheck()
                } label: {
                    CheckButton()
                }
                
                if (viewModel.resultIsShowing) {
                    Image(systemName: viewModel.result!.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .opacity(1.0)
                }
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

struct CheckButton: View {
    
    var body: some View {
        Image(systemName: "magnifyingglass")
            .imageScale(.large)
            .frame(width: 30, height: 30)
            .foregroundColor(.primary)
            .padding()
    }
}
