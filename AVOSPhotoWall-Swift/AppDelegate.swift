//
//  AppDelegate.swift
//  TutorialAVOSCloud
//
//  Created by Qihe Bian on 6/9/14.
//  Copyright (c) 2014 AVOS. All rights reserved.
//

import UIKit

//填写你的AppID和AppKey
let AVOSAppID = "60zyuccumbcvivbyl2x0044e6ngteibcqyy6pzfcc4l5xez4"
let AVOSAppKey = "6qglov18fpqm0dyy6pmayodfy5grkbcgsi8l03ek9vdwxgb7"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool{
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        if AVOSAppID == "" || AVOSAppKey == "" {
            NSLog("请设置 AVOSAppID 和 AVOSAppKey")
            exit(1)
        }
        AVOSCloud.setApplicationId(AVOSAppID, clientKey: AVOSAppKey)
        UINavigationBar.appearance().barStyle = UIBarStyle.Black
        UINavigationBar.appearance().translucent = true
        
        var vc:LoginViewController = LoginViewController()
        var nav:UINavigationController = UINavigationController(rootViewController: vc)
        self.window!.rootViewController = nav
        self.window!.backgroundColor = UIColor.whiteColor()
        self.window!.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(application: UIApplication!, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData!) {
        var currentInstallation:AVInstallation = AVInstallation.currentInstallation()
        currentInstallation.setDeviceTokenFromData(deviceToken);
        currentInstallation.saveInBackground()
    }
    
    func application(application: UIApplication!, didFailToRegisterForRemoteNotificationsWithError error: NSError!) {
        NSLog("Failed to get token, error: %@", error);
    }
}

