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
        print("active")
        LocationClient.sharedInstance.manager.startMonitoringForRegion(LocationClient.sharedInstance.airportRegion)
        LocationClient.sharedInstance.manager.startMonitoringForRegion(LocationClient.sharedInstance.destinationRegion)
//        performSelector(#selector(LocationClient.sharedInstance.requestStateForRegion), withObject: nil, afterDelay: 1)
        LocationClient.sharedInstance.requestStateForRegion()
        
    }
    
//    func applicationWillResignActive(application: UIApplication) {
//        print ("background")
//        LocationClient.sharedInstance.manager.stopMonitoringForRegion(LocationClient.sharedInstance.airportRegion)
//        LocationClient.sharedInstance.manager.stopMonitoringForRegion(LocationClient.sharedInstance.destinationRegion)
//    }
}

