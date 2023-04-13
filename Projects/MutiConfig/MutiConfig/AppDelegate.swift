//
//  AppDelegate.swift
//  MutiConfig
//
//  Created by Ajay Babu Singineedi on 13/04/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        #if DEBUG
            print("Prepare DEBUG Configuration")
        #elseif STAGING
            print("Prepare STAGING Configuration")
        #elseif PILOT
            print("Prepare PILOT Configuration")
        #else
            print("Prepare PRODUCTION configuration")
        #endif
        
        if let code = Bundle.main.object(forInfoDictionaryKey: AppConfig.AppCode.rawValue) as? String, let url = Bundle.main.object(forInfoDictionaryKey: AppConfig.AppURL.rawValue) as? String {
            print(code)
            let urlString = url.replacingOccurrences(of: AppConfig.Placeholder.rawValue, with: "")
            print(urlString)
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

