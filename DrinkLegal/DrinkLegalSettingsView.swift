//
//  DrinkLegalSettingsView.swift
//  DrinkLegal
//
//  Created by Lorenzo Zemp on 24/06/21.
//

import SwiftUI

struct DrinkLegalSettingsView: View {
    
    @ObservedObject var viewModel: DrinkLegalViewModel
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section(header: Text("Date Settings")) {
                        Toggle(isOn: $viewModel.swapDateAndMonth, label: {
                            Text("Swap Date and Month")
                        })
                    }
                    
                    Section(header: Text("About this App")) {
                        Text("Placeholder Placeholder Placeholder Placeholder Placeholder Placeholder Placeholder PlaceholderPlaceholder Placeholder Placeholder Placeholder")
                            .multilineTextAlignment(.center)
                    }
                }
                .navigationTitle("Settings")
            }
        }
        .overlay(XDismissButton(isShowingSettingsView: $viewModel.isShowingSettingsView), alignment: .topTrailing)
    }
}

struct DrinkLegalSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkLegalSettingsView(viewModel: DrinkLegalViewModel())
    }
}
