//
//  DLLargeSymbolButton.swift
//  DrinkLegal
//
//  Created by Lorenzo Zemp on 29/06/21.
//

import SwiftUI

enum Symbols: String {
    
    case Gear = "gearshape"
    case Clear = "clear"
    case MagnifyingGlass = "magnifyingglass"
    
}

struct DLLargeSymbolButton: View {
    
    var symbolString: String
    
    var body: some View {
        Image(systemName: symbolString)
            .imageScale(.large)
            .frame(width: 30, height: 30)
            .foregroundColor(.primary)
            .padding()
    }
}

struct DLLargeSymbolButton_Previews: PreviewProvider {
    static var previews: some View {
        DLLargeSymbolButton(symbolString: Symbols.Gear.rawValue)
    }
}
