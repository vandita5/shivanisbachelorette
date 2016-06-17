//
//  AppDelegate.swift
//  ShivanisBachelorette
//
//  Created by Vandita Sharma on 6/14/16.
//  Copyright © 2016 Vandita Sharma. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationDidBecomeActive(application: UIApplication) {
        LocationClient.sharedInstance.requestStateForRegion()
    }

}

