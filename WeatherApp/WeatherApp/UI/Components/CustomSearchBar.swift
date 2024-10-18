//
//  CustomSearchBar.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 17/10/24.
//

import SwiftUI

struct CustomSearchBar: View {
    
    // MARK: - Properties -
    @Binding var searchText: String
    @FocusState var focusedField: Bool
    let isSearchEnable: Bool
    let action: () -> ()
    
    // MARK: - Principal View -
    var body: some View {
        HStack {
            TextField("Introduce una ciudad...".localized, text: $searchText)
                .textFieldStyle(CustomRounderedTextFieldStyle())
            Button {
                action()
            } label: {
                Image(systemName: "magnifyingglass.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.green)
                    .opacity(isSearchEnable ? 1 : 0.6 )
                    .frame(width: 40, height: 40)
            }
            .disabled(!isSearchEnable)
            
        }
        .padding()
        .background(Color.mint.opacity(0.5))
    }
}

#Preview {
    CustomSearchBar(searchText: .constant(""), isSearchEnable: true, action: {})
}
