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
                HStack(alignment: .center) { //Refactor HStack into its own view struct
                    TextField(viewModel.swapDateAndMonth ? "MM" : "DD", text: viewModel.swapDateAndMonth ? $viewModel.birthMonth : $viewModel.birthDay)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .frame(width: 65)
                        .onChange(of: viewModel.swapDateAndMonth ? viewModel.birthMonth : viewModel.birthDay, perform: { value in
                            viewModel.formatDOBString(dateType: viewModel.swapDateAndMonth ? .Month : .Day)
                        })
                    
                    Text("/")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    
                    TextField(viewModel.swapDateAndMonth ? "DD" : "MM", text: viewModel.swapDateAndMonth ? $viewModel.birthDay : $viewModel.birthMonth)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .frame(width: 65)
                        .onChange(of: viewModel.swapDateAndMonth ? viewModel.birthDay : viewModel.birthMonth, perform: { value in
                            viewModel.formatDOBString(dateType: viewModel.swapDateAndMonth ? .Day : .Month)
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
                    
                if (viewModel.resultIsShowing) {
                    Image(systemName: viewModel.result!.rawValue)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .opacity(1.0)
                        .padding()
                } else {
                    Text("Enter Birthdate")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding()
                }
                
                Button {
                    withAnimation {
                        viewModel.submitButtonPressed()
                    }
                } label: {
                    CheckButton()
                }
            }
        }
        .overlay(Button {
            withAnimation {
                viewModel.clearDOBString()
            }
        } label: {
            ClearButton()
        }, alignment: .topTrailing)
        
        .overlay(Button {
            viewModel.showSettingsView()
        } label: {
            GearButton()
        }, alignment: .topLeading)
        
        .onTapGesture {
            hideKeyboard()
        }
        
        .sheet(isPresented: $viewModel.isShowingSettingsView, content: {
            DrinkLegalSettingsView(viewModel: viewModel)
        })
        
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

struct GearButton: View {
    
    var body: some View {
        Image(systemName: "gearshape")
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
