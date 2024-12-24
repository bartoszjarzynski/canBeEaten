//
//  AllergensView.swift
//  CanBeEaten
//
//  Created by Bartosz Jarzyński on 25/12/2024.
//

import SwiftUI

struct MainView: View {
    let allergens = [
        "Milk", "Eggs", "Fish", "Crustaceans",
        "Nuts", "Peanuts", "Soybeans", "Wheat"
    ]
    
    let allergenIcons: [String: String] = [
        "Milk": "🥛",
        "Eggs": "🍳",
        "Fish": "🐟",
        "Crustaceans": "🦐",
        "Nuts": "🌰",
        "Peanuts": "🥜",
        "Soybeans": "🫘",
        "Wheat": "🌾"
    ]
    
    @State private var selectedAllergens: Set<String> = []
    @State private var navigateToFinalMainView = false

    var body: some View {
        ZStack {
            Color(hex: 0x232323)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: -10) {
                Text("CHOOSE WHAT")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.leading, 20)

                Text("ARE YOU")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.leading, 20)

                Text("ALLERGIC TO")
                    .font(.system(size: 55, weight: .bold))
                    .foregroundColor(Color.green)
                    .padding(.leading, 20)

                Spacer().frame(height: 20)
                
                // Allergen Grid
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 20),
                    GridItem(.flexible(), spacing: 20)
                ], spacing: 20) {
                    ForEach(allergens, id: \.self) { allergen in
                        AllergyTile(
                            title: allergen,
                            icon: allergenIcons[allergen] ?? "questionmark.circle.fill",
                            isSelected: selectedAllergens.contains(allergen)
                        ) {
                            if selectedAllergens.contains(allergen) {
                                selectedAllergens.remove(allergen)
                            } else {
                                selectedAllergens.insert(allergen)
                            }
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                
                Spacer()
                
                // Confirm and Navigate Button
                NavigationLink(
                    destination: FinalMainView(selectedAllergens: Array(selectedAllergens)),
                    isActive: $navigateToFinalMainView
                ) {
                    Button(action: {
                        navigateToFinalMainView = true
                    }) {
                        Text("Confirm Selections")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 30)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
