//
//  AllergyTile.swift
//  CanBeEaten
//
//  Created by Bartosz Jarzyński on 25/12/2024.
//

import SwiftUI

struct AllergyTile: View {
    var title: String
    var icon: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                Text(icon)
                    .font(.system(size: 40))
                    .foregroundColor(isSelected ? .green : .white)
                
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 22))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
            }
            .padding()
            .frame(width: 120, height: 100)
            .background(isSelected ? Color.green.opacity(0.3) : Color.white.opacity(0.1))
            .cornerRadius(10)
        }
    }
}
