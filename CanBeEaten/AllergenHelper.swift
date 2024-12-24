//
//  AllergenHelper.swift
//  CanBeEaten
//
//  Created by Bartosz Jarzyński on 25/12/2024.
//

func iconForAllergen(_ allergen: String) -> String {
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
    return allergenIcons[allergen] ?? "❓"
}
