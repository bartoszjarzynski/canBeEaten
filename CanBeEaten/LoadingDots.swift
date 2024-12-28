//
//  LoadingDots.swift
//  CanBeEaten
//
//  Created by Bartosz Jarzyński on 28/12/2024.
//

import SwiftUI

struct LoadingDotsView: View {
    @State private var circleAOffset: CGFloat = 0
    @State private var circleBOffset: CGFloat = 0
    @State private var circleCOffset: CGFloat = 0
    
    let jumpDuration: Double = 0.30
    let delayDuration: Double = 1.25
    
    var body: some View {
        HStack(spacing: 10) {
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.green)
                .offset(y: circleAOffset)
                .animation(.easeInOut(duration: jumpDuration).repeatForever(autoreverses: true).delay(0), value: circleAOffset)
            
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.green)
                .offset(y: circleBOffset)
                .animation(.easeInOut(duration: jumpDuration).repeatForever(autoreverses: true).delay(delayDuration), value: circleBOffset)
            
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.green)
                .offset(y: circleCOffset)
                .animation(.easeInOut(duration: jumpDuration).repeatForever(autoreverses: true).delay(delayDuration * 2), value: circleCOffset)
        }
        .onAppear {
            self.circleAOffset = -30
            self.circleBOffset = -30
            self.circleCOffset = -30
        }
    }
}
