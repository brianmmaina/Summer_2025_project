//
//  SplashView.swift
//  TrailLog
//
//  Created by Brian Maina on 5/24/25.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        // top‐level if/else — no Group needed
        if isActive {
            LoginView()
        } else {
            VStack(spacing: 20) {
                Image("AppIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                Text("Trail Logs")
                    .font(.largeTitle).bold()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}





