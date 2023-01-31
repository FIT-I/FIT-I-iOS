//
//  AppDelegate.swift
//  FITI
//
//  Created by 홍준혁 on 2023/01/01.
//

import UIKit
import SendbirdUIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let sendBirdAppId = Bundle.main.infoDictionary?["5AEF38C5-B43C-43B2-ADE3-7536C5585164"] ?? ""
        SendbirdUI.initialize(applicationId: sendBirdAppId as! String) {
              // Do something to display the start of the SendbirdUIKit initialization.
          } migrationHandler: {
              // Do something to display the progress of the DB migration.
          } completionHandler: { error in
              // Do something to display the completion of the SendbirdChat initialization.
          }
        
        // set current user
        SBUGlobals.currentUser = SBUUser(userId: "1")
        // Override point for customization after application launch.
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
