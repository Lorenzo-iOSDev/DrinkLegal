//
//  DrinkLegalViewModel.swift
//  DrinkLegal
//
//  Created by Lorenzo Zemp on 3/06/21.
//

import SwiftUI

final class DrinkLegalViewModel: ObservableObject {
    
    @Published var birthDate = ""
    
    let characterLimit = 10
    
    func formatAndLimitDOBString(_ string: String) {
        if string.count == 2 || string.count == 5 {
            birthDate.append("/")
        } else if string.count > characterLimit {
            birthDate = String(birthDate.prefix(characterLimit))
        }
    }
    
    func clearDOBString() {
        birthDate = ""
    }
}
