//
//  AppDelegate.swift
//  tabMan
//
//  Created by victor rodriguez on 11/15/16.
//  Copyright © 2016 Victor Rodriguez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        //This method is called when the user exits the app.
        //The following code will capture the time/date and save it to userDefaults so we can access it later.
        let lastTimeBillWasSaved = NSDate()
        UserDefaults.standard.set(lastTimeBillWasSaved, forKey:"lastTimeBillWasSaved")
        print("application entered background")
        print("Bill was last saved on \(lastTimeBillWasSaved)")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        
        //===========================================
        //Originally I tried using this method to calculate when more than 10minutes had passed since the user had last exited the app but I found that I couldn't manipulate the text labels in the viewcontroller so I googled and found that I could use the notification center to run an app whenever the user entered the app. [See ViewController.ViewDidLoad]
        //===========================================
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

