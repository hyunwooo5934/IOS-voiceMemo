//
//  voiceMemoApp.swift
//  voiceMemo
//
//  Created by tecace on 2024/02/21.
//

import SwiftUI

@main
struct voiceMemoApp: App {
    @UIApplicationDelegateAdaptor(AppdDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
    }
}
