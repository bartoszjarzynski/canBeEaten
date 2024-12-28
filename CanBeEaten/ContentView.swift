import SwiftUI

struct ContentView: View {
    @State private var navigateToMainView = false
    @State private var showLoadingDots = false
    @State private var textOffset: [CGFloat] = [UIScreen.main.bounds.width, UIScreen.main.bounds.width, UIScreen.main.bounds.width, UIScreen.main.bounds.width]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: 0x232323)
                    .ignoresSafeArea()

                VStack {
                    VStack(alignment: .leading, spacing: -10) {
                        ForEach(0..<4, id: \.self) { index in
                            Text(textForLine(at: index))
                                .font(.system(size: index == 2 ? 80 : 60, weight: .bold))
                                .foregroundColor(index == 2 ? Color.green : .white)
                                .offset(x: textOffset[index])
                                .animation(.easeOut(duration: 0.85).delay(Double(index) * 0.75), value: textOffset[index]) // Animate with delay for each line
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    .padding(.top, 100)

                    Spacer()

                    Text("Loading...")
                        .font(.system(size: 13))
                        .foregroundColor(Color.gray)
                        .padding(.bottom, 30)

                    if showLoadingDots {
                        LoadingDotsView()
                            .frame(height: 100)
                    }
                }

                NavigationLink(destination: MainView(), isActive: $navigateToMainView) {
                    EmptyView()
                }
            }
            .onAppear {
                startLoadingAnimation()
            }
        }
    }

    private func textForLine(at index: Int) -> String {
        switch index {
        case 0: return "CHECK"
        case 1: return "WHAT YOU"
        case 2: return "CAN EAT"
        case 3: return "WITH US"
        default: return ""
        }
    }

    private func startLoadingAnimation() {
        showLoadingDots = true
        // Animate text from the left to its current position
        withAnimation(.easeOut(duration: 0.50)) {
            textOffset = [0, 0, 0, 0]
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            self.navigateToMainView = true
        }
    }
}
    
    func openCamera() {
        print("Opening Camera...")
    }
    
    func changeAllergens() {
        print("Navigating to change allergens...")
    }


#Preview {
    ContentView()
}
