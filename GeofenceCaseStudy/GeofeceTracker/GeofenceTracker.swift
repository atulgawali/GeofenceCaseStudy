//
//  GeofenceTracker.swift
//  GeofenceCaseStudy
//
//  Created by Atul Gawali on 20/07/21.
//

import Foundation

/// The Geofence Tracker Delegate is used to pass the event to controller.
///
protocol GeofenceTrackerDelegate: AnyObject {
    /// The updated region called when region update
    ///
    /// - Parameter region: The list of the region we need to display
    ///
    func updatedRegion(region: [GeofenceRegion])
}

class GeofenceTracker {

    // MARK: - Properties
    static let shared = GeofenceTracker()

    /// The delegate used to trigger event
    weak var delegate: GeofenceTrackerDelegate?

    /// The region list store in memory.
    fileprivate var regionList: [GeofenceRegion]

    /// The geofence event tracker deal with the location.
    fileprivate let geofenceTracker = LocationEventManager()

    // Initialization
    private init() {
        regionList = [
            GeofenceRegion(id: "001", isEntered: false, latitude: 40.6892, longitude: 74.0445, name: "Statue of Liberty", radius: 50),
            GeofenceRegion(id: "002", isEntered: false, latitude: 51.5014, longitude: 0.1419, name: "Buckingham Palace", radius: 50),
            GeofenceRegion(id: "003", isEntered: false, latitude: 47.5576, longitude: 10.7498, name: "Neuschwanstein Castle", radius: 50),
            GeofenceRegion(id: "004", isEntered: false, latitude: 19.0176147, longitude: 72.8561644, name: "Mumbai India", radius: 50),
        ]

        geofenceTracker.initializeLocationManager()
        geofenceTracker.delegate = self

        for item in regionList {
            geofenceTracker.addCircularRegion(id: item.id, lat: item.latitude, lng: item.longitude, radius: item.radius)
        }
    }

    /// Get region list public function
    ///
    /// - returns: The list of geofence array.
    func getRegionList() -> [GeofenceRegion] {
        return regionList
    }

    /// The update Geofence in the memory
    ///
    /// - Parameters:
    ///  -  id: The geofence id
    ///  -  isEntered: The bool value need to updated in model
    ///
    fileprivate func updateGeofence(id: String, isEntered: Bool) {
        regionList = regionList.map { item in
            var region = item
            if region.id == id {
                region.isEntered = isEntered
            }
            return region
        }
    }
}

extension GeofenceTracker: LocationManagerDelegate {
    /// The updated region called when region update
    ///
    /// - Parameters:
    ///  -  region: The list of the region we need to display
    ///  -  isEntered: The bool value need to updated in model
    ///
    func didUpdateRegion(id: String, isEntered: Bool) {
        self.updateGeofence(id: id, isEntered: isEntered)
        delegate?.updatedRegion(region: self.regionList)
        EventLogger.shared.printLog(message: "did Update Region", event: .i)
    }
}
