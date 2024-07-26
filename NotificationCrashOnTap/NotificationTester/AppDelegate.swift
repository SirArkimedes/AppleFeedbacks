//
//  AppDelegate.swift
//  NotificationTester
//
//  Created by Andrew Robinson on 7/25/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        application.registerForRemoteNotifications()

        // If this is set to AppDelegate as the delegate, the situation is fine.
        // Since this is set to Test.instance, the app crashes.
        //
        //
        UNUserNotificationCenter.current().delegate = Test.instance
        //
        //
        //
        //

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) async -> UIBackgroundFetchResult {
        return .noData
    }
}



class Test: NSObject {
    static let instance = Test()
}

extension Test: UNUserNotificationCenterDelegate {
    // Called when a remote notification is received that has displayable information, but only while in foreground.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification) async -> UNNotificationPresentationOptions {
        return [[.list, .banner, .badge, .sound]]
    }

    // Conforming to this protocol works as expected.
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        print("HIT!")
//    }

    // Conforming to this protocol crashes the app when tapping on a
    // notification while the app is background.
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        print("HIT!")
    }
}
