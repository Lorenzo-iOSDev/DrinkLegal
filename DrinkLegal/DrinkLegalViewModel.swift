//
//  DrinkLegalViewModel.swift
//  DrinkLegal
//
//  Created by Lorenzo Zemp on 3/06/21.
//

import SwiftUI

enum Legality {
    case Legal
    case Illegal
    case CheckLicense
}

final class DrinkLegalViewModel: ObservableObject {
    
    @Published var birthDate = ""
    @Published var result: Legality? = nil
    
    let dateFormatter = DateFormatter()
    let characterLimit = 10
    
    func convertStringToDate() {
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = TimeZone.current
        
        if (!birthDate.isEmpty){
            let date = dateFormatter.date(from: birthDate)
            print(date!)
            print(dateFormatter.string(from: date!))
        }
    }
    
    func formatDOBString() {
        if birthDate.count == 2 || birthDate.count == 5 {
            birthDate.append("/")
        } else if birthDate.count > characterLimit {
            birthDate = String(birthDate.prefix(characterLimit))
            //animate textfield shake to show its full
        } else if birthDate.count == characterLimit {
            convertStringToDate()
        }
    }
    
    func clearDOBString() {
        birthDate = ""
    }
}
