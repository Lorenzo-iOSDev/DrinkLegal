//
//  Alert.swift
//  DrinkLegal
//
//  Created by Lorenzo Zemp on 12/06/21.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    static let invalidBirthDate = AlertItem(title: Text("Invalid Date"),
                                            message: Text("Please enter a valid Date of Birth"),
                                            dismissButton: .default(Text("OK")))
}
