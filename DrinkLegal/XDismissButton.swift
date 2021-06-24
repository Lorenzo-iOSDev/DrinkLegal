//
//  XDismissButton.swift
//  DrinkLegal
//
//  Created by Lorenzo Zemp on 24/06/21.
//

import SwiftUI

struct XDismissButton: View {
    
    @Binding var isShowingSettingsView: Bool
    
    var body: some View {
        HStack{
            Spacer()
            
            Button {
                isShowingSettingsView = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 40, height: 40)
            }
        }.padding(.all, 10)
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton(isShowingSettingsView: .constant(true))
    }
}
