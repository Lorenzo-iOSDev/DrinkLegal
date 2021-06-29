//
//  ResultVIew.swift
//  DrinkLegal
//
//  Created by Lorenzo Zemp on 29/06/21.
//

import SwiftUI

struct ResultView: View {
    
    var resultString: String
    
    var body: some View {
        Image(systemName: resultString)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .opacity(1.0)
            .padding()
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(resultString: Legality.Legal.rawValue)
    }
}
