//
//  AppDelegate.swift
//  LetsEat
//
//  Created by Craig Clayton on 11/8/17.
//  Copyright © 2017 Cocoa Academy. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        initialize()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


private extension AppDelegate {
    
    func initialize() {
        setupDefaultColors()
        checkNotifications()
    }
    
    func checkNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (isGranted, error) in
            let optionOne = UNNotificationAction(identifier: Option.one.rawValue, title: "Yes", options: [.foreground])
            let optionTwo = UNNotificationAction(identifier: Option.two.rawValue, title: "No", options: [.foreground])
            let category = UNNotificationCategory(identifier: Identifier.reservationCategory.rawValue, actions: [optionOne, optionTwo], intentIdentifiers: [], options: [])
            UNUserNotificationCenter.current().setNotificationCategories([category])
        }
    }

    
    func setupDefaultColors() {
        guard let red = UIColor(named: "LetsEat Red") else { return }
        
        UITabBar.appearance().tintColor = red
        UITabBar.appearance().barTintColor = .white
        
        UITabBarItem.appearance()
            .setTitleTextAttributes(
                [NSAttributedStringKey.foregroundColor: UIColor.black],
                for: UIControlState.normal)
        UITabBarItem.appearance()
            .setTitleTextAttributes(
                [NSAttributedStringKey.foregroundColor: red],
                for: UIControlState.selected)
        
        UINavigationBar.appearance().tintColor = red
        UINavigationBar.appearance().barTintColor = .white
        
        UITabBar.appearance().isTranslucent = false
        UINavigationBar.appearance().isTranslucent = false
    }
}
