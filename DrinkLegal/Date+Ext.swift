//
//  Date+Ext.swift
//  DrinkLegal
//
//  Created by Lorenzo Zemp on 7/06/21.
//

import Foundation

extension Date {
    var eighteenYearsAgo : Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date())!
    }
}
