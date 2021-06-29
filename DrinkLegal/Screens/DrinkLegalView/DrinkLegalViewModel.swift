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
}

enum DateType {
    case Day
    case Month
    case Year
}

final class DrinkLegalViewModel: ObservableObject {
    
    @Published var isShowingSettingsView = false
    
    @Published var result: Legality?
    @Published var alertItem: AlertItem?
    @Published var resultIsShowing: Bool = false
    @Published var swapDateAndMonth: Bool = false {
        didSet {
            clearDOBString()
            UserDefaults.standard.set(swapDateAndMonth, forKey: "DateMonthSetting")
        }
    }
    
    @Published var birthDay = ""
    @Published var birthMonth = ""
    @Published var birthYear = ""
    
    let dateFormatter = DateFormatter()
    let characterLimit = 10
    
    var date: Date? = nil
    var legalAge = Date().eighteenYearsAgo
    
    var birthDate: String {
        birthDay + "/" + birthMonth + "/" + birthYear
    }
    
    func showSettingsView() { isShowingSettingsView = true }
    
    func submitButtonPressed() {
        if (validDateCheck()) {
            convertStringToDate()
            compareDate()
        }
    }
    
    func compareDate() {
        guard let date = date else { return } // return error alert
        if date <= Date().eighteenYearsAgo {
            result = .Legal
        } else if date > Date().eighteenYearsAgo {
            result = .Illegal
        }
        
        resultIsShowing = true
        
    }
    
    func convertStringToDate() {
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.timeZone = TimeZone.current
        
         if (!birthDate.isEmpty){
            date = dateFormatter.date(from: birthDate)
        }
    }
    
    func formatDOBString(dateType: DateType) {
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
    
    func validDateCheck() -> Bool {
        guard let birthDayInt = Int(birthDay), let birthMonthInt = Int(birthMonth) else {
            alertItem = AlertContext.invalidBirthDate
            return false
        }
        
        if birthDayInt > 31 || birthMonthInt > 12  || birthYear.count < 4{
            alertItem = AlertContext.invalidBirthDate
            return false
        } else {
            return true
        }
    }
    
    func clearDOBString() {
        resultIsShowing = false
        
        birthDay = ""
        birthMonth = ""
        birthYear = ""
    }
    
    init() {
        self.swapDateAndMonth = UserDefaults.standard.object(forKey: "DateMonthSetting") as? Bool ?? false
    }
}
