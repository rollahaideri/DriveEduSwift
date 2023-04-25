//
//  DriveEduApp.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-02-13.
//

import SwiftUI

@main
struct DriveEduApp: App {
    @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true
    var body: some Scene {
        WindowGroup {
            NavigationView {
            if isFirstLaunch {
                // Show the onboarding view for the first launch
                OnboardingView()
                    .onDisappear {
                        // Update the flag when the onboarding view disappears
                        isFirstLaunch = false
                    }
            } else {
                // Show the main content view after the first launch
                ContentView(viewModel: AuthViewModel())
            }
        }
        }
    }
}
