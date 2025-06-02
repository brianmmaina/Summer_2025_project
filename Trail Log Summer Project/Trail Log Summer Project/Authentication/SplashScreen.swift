//
//  SplashScreen.swift
//  Trail Log Summer Project
//
//  Created by Brian Maina on 5/28/25.
//

import SwiftUI
import Combine


struct SplashScreen:View {
    @State private var shouldNavigate = false
    @State private var logoOpacity = 0.0
    
    private let splashDuration: TimeInterval = 3.0
    var body: some View {
        ZStack{
            LinearGradient(colors:
                            [Color(red: 0.17, green: 0.37, blue: 0.18),
                             Color(red: 0.77, green: 0.92, blue: 0.18),]
                           ,startPoint: .topLeading,
                           endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 12){
                //this part is literally just for the logo and text, i played around with the size and found out how to center it. the colors can be changed and for the text i though it looked tougher without it but we could just fill it in if we want
                Image("TrailLogsLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 32, style: .continuous)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 32, style: .continuous)
                            .stroke(Color.white, lineWidth: 3)
                    )
                    .shadow(color: Color.black.opacity(0.1), radius: 2, x:0 , y:1)
                    .opacity(logoOpacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.6)){
                            logoOpacity = 1.0
                        }
                    }
                
                Text("")
                    .font(.system(size:40, weight: .semibold, design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(Rectangle())
        }
        //after this it goes to mainentryview which checks if its logged in already, if it isnt it goes to the log in page.
        .fullScreenCover(isPresented: $shouldNavigate){
            MainEntryView()
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + splashDuration){
                shouldNavigate = true
            }
        }
    }
}
//using this for the screen previews
struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
//Watched a tutorial for this, it checks if the user is loged in using the AuthService as an global observable object so any part of the code can check it. stays constant once set
final class AuthService: ObservableObject {
    static let shared = AuthService()

    //it sets it to false and becomes true once checked
    @Published var isSignedIn: Bool = false

    private init() {
        //checks the login after 0.1 seconds and sees if it was previously logged in but its just filler cuz we dont have any backend rn
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            //sets it to false but we will implement this part when we do the backend for the log in :)
            self.isSignedIn = false
        }
    }
}


