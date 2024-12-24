//
//  MainView.swift
//  CanBeEaten
//
//  Created by Bartosz Jarzyński on 25/12/2024.
//

import SwiftUI

struct FinalMainView: View {
    let selectedAllergens: [String]

    @Environment(\.dismiss) var dismiss // Environment variable to handle dismissing the current view
    @State private var isCameraPresented = false
    @State private var capturedImage: UIImage? = nil // Store the captured image

    var body: some View {
        ZStack {
            Color(hex: 0x232323)
                .ignoresSafeArea()

            VStack {
                // Top title
                VStack(alignment: .leading, spacing: -10) {
                    Text("YOUR CHOSEN")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.leading, 20)

                    Text("ALLERGENS")
                        .font(.system(size: 55, weight: .bold))
                        .foregroundColor(Color.green)
                        .padding(.leading, 20)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 50)
                
                Spacer().frame(height: 20)
                
                // Display allergens or fallback message
                if selectedAllergens.isEmpty {
                    // Fallback widget
                    VStack {
                        Text("You have no allergens chosen")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red.opacity(0.3))
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                    }
                    .frame(maxHeight: .infinity)
                } else {
                    // Allergen widgets displayed in the same style
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 20),
                        GridItem(.flexible(), spacing: 20)
                    ], spacing: 20) {
                        ForEach(selectedAllergens, id: \.self) { allergen in
                            AllergyTile(
                                title: allergen,
                                icon: iconForAllergen(allergen),
                                isSelected: true, // Always show as selected in this view
                                action: {} // No action needed here
                            )
                        }
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                }

                Spacer()
                
                // Buttons at the bottom
                VStack(spacing: 20) {
                    // Button to Scan Product
                    Button(action: {
                        isCameraPresented = true // Open the camera
                    }) {
                        Text("Scan Product")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: 250)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    
                    // Button to Change Allergens
                    Button(action: {
                        dismiss() // Navigate back to the previous view
                    }) {
                        Text("Change Allergens")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: 250)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
            }
        }
        .sheet(isPresented: $isCameraPresented) {
            CameraView(isPresented: $isCameraPresented) { image in
                self.capturedImage = image
                // Handle the captured image here
                print("Image captured: \(image)")
            }
        }
    }
}
