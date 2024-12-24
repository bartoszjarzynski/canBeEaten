import SwiftUI

struct ContentView: View {
    @State private var navigateToMainView = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: 0x232323)
                    .ignoresSafeArea()
                
                VStack {
                    VStack(alignment: .leading, spacing: -10) {
                        Text("CHECK")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("WHAT YOU")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("CAN EAT")
                            .font(.system(size: 80, weight: .bold))
                            .foregroundColor(Color.green)
                        
                        Text("WITH US")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    .padding(.top, 100)
                    
                    Spacer()
                    
                    Text("Swipe to the right to select the allergens")
                        .font(.system(size: 13))
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 100)
                }
                
                NavigationLink(destination: MainView(), isActive: $navigateToMainView) {
                    EmptyView()
                }
            }
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width > 100 {
                            navigateToMainView = true
                        }
                    }
            )
        }
    }
}
    
    // Open the camera
    func openCamera() {
        // Code to handle camera access here
        print("Opening Camera...")
        // This requires the use of UIImagePickerController or a similar SwiftUI implementation
    }

    // Navigate to change allergens
    func changeAllergens() {
        // Code to navigate back to MainView to modify allergens
        print("Navigating to change allergens...")
    }


#Preview {
    ContentView()
}
