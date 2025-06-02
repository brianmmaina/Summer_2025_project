//
//  MainEntryView.swift
//  Trail Log Summer Project
//
//  Created by Brian Maina on 6/2/25.
//


import SwiftUI

struct MainEntryView: View {
    @ObservedObject private var auth = AuthService.shared

    var body: some View {
        Group {
            if auth.isSignedIn {
                // The user is already logged in → go straight to the main app
                MainTabView()
            } else {
                // The user is not logged in yet → show the login screen
                LoginView()
            }
        }
    }
}

struct MainEntryView_Previews: PreviewProvider {
    static var previews: some View {
        MainEntryView()
    }
}
