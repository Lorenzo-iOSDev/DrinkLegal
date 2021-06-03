//
//  HideKeyboard.swift
//  DrinkLegal
//
//  Created by Lorenzo Zemp on 3/06/21.
//

import SwiftUI

//UIKit Component
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
