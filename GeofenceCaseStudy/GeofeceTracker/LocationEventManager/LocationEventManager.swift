//
//  ViewController.swift
//  GeofenceCaseStudy
//
//  Created by Atul Gawali on 20/07/21.
//
import CoreLocation

protocol LocationManagerDelegate: AnyObject {
    /// The updated region called when region update
    ///
    /// - Parameters:
    ///  -  region: The list of the region we need to display
    ///  -  isEntered: The bool value need to updated in model
    ///
    func didUpdateRegion(id: String, isEntered:Bool)
}

/// The Location Event Manager is used to manage location region change event
///
class LocationEventManager: NSObject, CLLocationManagerDelegate {
   static let sharedInstance = LocationEventManager()
    let kGPSRegionRadius = 50
    let manager : CLLocationManager = CLLocationManager()
    weak var delegate:LocationManagerDelegate?

    /// The initialize of location manager
    ///
    func initializeLocationManager(){
        manager.delegate = self
        manager.requestAlwaysAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        manager.distanceFilter = CLLocationDistance(kGPSRegionRadius);
        manager.activityType = .automotiveNavigation;
        manager.startUpdatingLocation()
        manager.startMonitoringSignificantLocationChanges()
    }

    /// The updated region called when region update
    ///
    /// - Parameters:
    ///  -  id: The id of region.
    ///  -  lat: The latitude of region.
    ///  -  lng: The longitude  of the region.
    ///  -  radius: The radius of the area.
    func addCircularRegion(id: String, lat:Double, lng:Double, radius:Int32){
        let circularRegion: CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2DMake(lat, lng), radius: CLLocationDistance(radius), identifier: String(id))
        manager.startMonitoring(for: circularRegion)
        circularRegion.notifyOnEntry = true
        circularRegion.notifyOnExit = true
    }

    // MARK: CLLocationManagerDelegate Methods
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        EventLogger.shared.printLog(message: "Location status: \(status.rawValue)", event: .i)
    }

    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        EventLogger.shared.printLog(message: "The monitored regions are: \(manager.monitoredRegions)", event: .i)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        EventLogger.shared.printLog(message: "locations = \(locValue.latitude) \(locValue.longitude)", event: .i)
    }

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        self.delegate?.didUpdateRegion(id: region.identifier, isEntered: true)
    }

    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        self.delegate?.didUpdateRegion(id: region.identifier, isEntered: false)
    }
}


