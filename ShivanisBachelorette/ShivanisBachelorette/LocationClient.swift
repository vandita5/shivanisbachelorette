//
//  LocationClient.swift
//  ShivanisBachelorette
//
//  Created by Vandita Sharma on 6/16/16.
//  Copyright © 2016 Vandita Sharma. All rights reserved.
//

import CoreLocation

class LocationClient: NSObject, CLLocationManagerDelegate {
    static let sharedInstance = LocationClient()

    private let airportCoordinate: CLLocationCoordinate2D  = CLLocationCoordinate2DMake(10.75384273, -73.99906660)
    lazy var airportRegion: CLCircularRegion = {
        return CLCircularRegion(center: self.airportCoordinate, radius: 100, identifier: "airport")
    }()
    var inAirport: Bool?
    private let manager = CLLocationManager()
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestStateForRegion() {
        guard CLLocationManager.locationServicesEnabled() else {
            print("Device doesn't allow location servcies")
            return
        }
        if CLLocationManager.authorizationStatus() == .AuthorizedAlways {
            manager.startMonitoringForRegion(airportRegion)
            manager.requestStateForRegion(airportRegion)
            
        } else {
            manager.requestAlwaysAuthorization()
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didDetermineState state: CLRegionState, forRegion region: CLRegion) {
        print("state \(state.rawValue)")
        print("region \(region)")
        if state == CLRegionState.Inside{
            inAirport = true
            print("yes here")
        } else {
            inAirport = false
            print("not here")
        }
    }
    
    func locationManager(manager: CLLocationManager, monitoringDidFailForRegion region: CLRegion?, withError error: NSError) {
        print(error.localizedDescription)
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        requestStateForRegion()
    }
}
