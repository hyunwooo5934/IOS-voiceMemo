//
//  AppDelegate.swift
//  voiceMemo
//
//  Created by tecace on 2024/02/21.
//

import UIKit

class AppdDelegate : NSObject, UIApplicationDelegate {
    var notificationDelegate = NotificationDelegate()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = notificationDelegate
        return true
    }
    
}
