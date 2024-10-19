//
//  MonumentCell.swift
//  WeatherApp
//
//  Created by Silvia Casanova Martinez on 19/10/24.
//

import SwiftUI

struct MonumentCell: View {
    
    var image: String = "eiffel-tower"
    // MARK: - Principal View -
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.mint.opacity(0.5))
            .frame(width: 200, height: 150)
            .overlay(
                ZStack {
                    Image(image)
                }
                
            )
            .padding()
    }
}

#Preview {
    MonumentCell()
}
