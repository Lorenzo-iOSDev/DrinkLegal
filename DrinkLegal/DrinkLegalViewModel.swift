//
//  DrinkLegalViewModel.swift
//  DrinkLegal
//
//  Created by Lorenzo Zemp on 3/06/21.
//

import SwiftUI

enum Legality: String {
    case Legal = "checkmark"
    case Illegal = "xmark"
    case CheckLicense = "questionmark"
}

enum DateType {
    case Day
    case Month
    case Year
}

final class DrinkLegalViewModel: ObservableObject {
    
    @Published var birthDate = ""
    @Published var result: Legality?
    @Published var resultIsShowing: Bool = false
    @Published var alertItem: AlertItem?
    
    @Published var birthDay = ""
    @Published var birthMonth = ""
    @Published var birthYear = ""
    
    let dateFormatter = DateFormatter()
    let characterLimit = 10
    
    var date: Date? = nil
    var legalAge = Date().eighteenYearsAgo
    
    func compareDate() {
        guard let date = date else { return } // return error alert
        if date <= Date().eighteenYearsAgo {
            print("Is of Age")
            result = .Legal
        } else if date > Date().eighteenYearsAgo {
            print("Under Age")
            result = .Illegal
        }
    }
    
    func convertStringToDate() {
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = TimeZone.current
        
        if (!birthDate.isEmpty){
            date = dateFormatter.date(from: birthDate)
            guard let date = date else { return } // return error alert
            print(date)
            print(dateFormatter.string(from: date))
            resultIsShowing = true
        }
    }
    
    func formatDOBString(dateType: DateType) {
//        if birthDate.count == 2 || birthDate.count == 5 {
//            birthDate.append("/")
//        } else if birthDate.count > characterLimit {
//            birthDate = String(birthDate.prefix(characterLimit))
//            //animate textfield shake to show its full
//        } else if birthDate.count == characterLimit {
//            convertStringToDate()
//            compareDate()
//        } else if birthDate.count < characterLimit {
//            resultIsShowing = false
//        }
        
        switch dateType {
        case .Day:
            if birthDay.count > 2 {
                birthDay = String(birthDay.prefix(2))
            }
        case .Month:
            if birthMonth.count > 2 {
                birthMonth = String(birthMonth.prefix(2))
            }
        case .Year:
            if birthYear.count > 4 {
                birthYear = String(birthYear.prefix(4))
            }
        }
    }
    
    func validDateCheck() {
        //add guard let to unwrap
        
        if Int(birthDay)! > 31 || Int(birthMonth)! > 12 {
            alertItem = AlertContext.invalidBirthDate
        }
    }
    
    func clearDOBString() {
        //birthDate = ""
        birthDay = ""
        birthMonth = ""
        birthYear = ""
    }
}
