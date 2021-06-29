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
                DateFieldView(viewModel: viewModel)
                    
                if (viewModel.resultIsShowing) {
                    ResultView(resultString: viewModel.result!.rawValue)
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
                    DLLargeSymbolButton(symbolString: Symbols.MagnifyingGlass.rawValue)
                }
            }
        }
        .overlay(Button {
            withAnimation {
                viewModel.clearDOBString()
            }
        } label: {
            DLLargeSymbolButton(symbolString: Symbols.Clear.rawValue)
        }, alignment: .topTrailing)
        
        .overlay(Button {
            viewModel.showSettingsView()
        } label: {
            DLLargeSymbolButton(symbolString: Symbols.Gear.rawValue)
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
