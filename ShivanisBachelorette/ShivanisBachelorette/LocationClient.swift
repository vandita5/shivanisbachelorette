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

    private let airportCoordinate: CLLocationCoordinate2D  = CLLocationCoordinate2DMake(33.5620648, -86.7517764) // office(40.75384273, -73.99906660) 
    private let destinationCoordinate: CLLocationCoordinate2D  = CLLocationCoordinate2DMake(33.6822,-78.9322774) // Sid(40.729753,-74.0357059) // Vandy (40.7254886,-73.8614878) // MB (33.6822,-78.9322774)
    lazy var airportRegion: CLCircularRegion = {
        return CLCircularRegion(center: self.airportCoordinate, radius: 2000, identifier: "airport")
    }()
    lazy var destinationRegion: CLCircularRegion = {
        return CLCircularRegion(center: self.destinationCoordinate, radius: 5000, identifier: "myrtle beach")
    }()
    var inAirport: Bool?
    var atDestination: Bool?
    let manager = CLLocationManager()
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
            manager.requestStateForRegion(airportRegion)
            manager.requestStateForRegion(destinationRegion)
        } else {
            manager.requestAlwaysAuthorization()
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didDetermineState state: CLRegionState, forRegion region: CLRegion) {
        if region == airportRegion {
            if state == CLRegionState.Inside{
                inAirport = true
                print("yes here airport")
            } else {
                inAirport = false
                print("not here airport")
            }
        } else if region == destinationRegion {
            if state == CLRegionState.Inside{
                atDestination = true
                print("yes here MB")
            } else {
                atDestination = false
                print("not here MB")
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, monitoringDidFailForRegion region: CLRegion?, withError error: NSError) {
        print(error.localizedDescription)
    }
    
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        requestStateForRegion()
    }
}
