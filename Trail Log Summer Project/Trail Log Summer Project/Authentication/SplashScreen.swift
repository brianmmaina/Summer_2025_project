//
//  SplashScreen.swift
//  Trail Log Summer Project
//
//  Created by Brian Maina on 5/28/25.
//

import SwiftUI

struct SplashScreen: View {
  @State private var isActive = false

  var body: some View {
    Group {
      if isActive {
        // once the splash is done, go to the login flow
        LoginView()
      } else {
        // your logo + title
        VStack(spacing: 20) {
            
          Image("AppIcon")
            .resizable()
            .scaledToFit()
            .frame(width: 120, height: 120)

          Text("Trail Logs")
            .font(.largeTitle)
            .bold()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
      }
    }
    .onAppear {
      // after 2 seconds, animate into LoginView
      DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        withAnimation(.easeInOut) {
          isActive = true
        }
      }
    }
  }
}

#if DEBUG
struct SplashScreen_Previews: PreviewProvider {
  static var previews: some View {
    SplashScreen()
      .previewDevice("iPhone 16 Pro")
      .previewDisplayName("iPhone 16 Pro")
  }
}
#endif


