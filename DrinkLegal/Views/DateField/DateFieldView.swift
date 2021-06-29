//
//  DateFieldView.swift
//  DrinkLegal
//
//  Created by Lorenzo Zemp on 29/06/21.
//

import SwiftUI

struct DateFieldView: View {
    
    @StateObject var viewModel: DrinkLegalViewModel
    
    var body: some View {
        HStack(alignment: .center) { //Refactor HStack into its own view struct
            TextField(viewModel.swapDateAndMonth ? "MM" : "DD", text: viewModel.swapDateAndMonth ? $viewModel.birthMonth : $viewModel.birthDay)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .frame(width: 65)
                .onChange(of: viewModel.swapDateAndMonth ? viewModel.birthMonth : viewModel.birthDay, perform: { value in
                    viewModel.formatDOBString(dateType: viewModel.swapDateAndMonth ? .Month : .Day)
                })
            
            Text("/")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            TextField(viewModel.swapDateAndMonth ? "DD" : "MM", text: viewModel.swapDateAndMonth ? $viewModel.birthDay : $viewModel.birthMonth)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .frame(width: 65)
                .onChange(of: viewModel.swapDateAndMonth ? viewModel.birthDay : viewModel.birthMonth, perform: { value in
                    viewModel.formatDOBString(dateType: viewModel.swapDateAndMonth ? .Day : .Month)
                })
            
            Text("/")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            TextField("YYYY", text: $viewModel.birthYear)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .frame(width: 100)
                .onChange(of: viewModel.birthYear, perform: { value in
                    viewModel.formatDOBString(dateType: .Year)
                })
        }
    }
}

struct DateFieldView_Previews: PreviewProvider {
    static var previews: some View {
        DateFieldView(viewModel: DrinkLegalViewModel())
    }
}
