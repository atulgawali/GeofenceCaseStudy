//
//  ViewController.swift
//  GeofenceCaseStudy
//
//  Created by Atul Gawali on 20/07/21.
//

import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {
    
    /// The TableView instance to display, list of region
    @IBOutlet weak var geofenceTableView: UITableView!

    /// The region list to display
    var regionList = [GeofenceRegion]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GeofenceTracker.shared.delegate = self
        regionList = GeofenceTracker.shared.getRegionList()

        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
            AnalyticsParameterItemID: "Geofence_Case_Study_Id"
        ])
    }

    override func didReceiveMemoryWarning() {
        EventLogger.shared.printLog(message: "Memory warning", event: .w)
    }
}

// MARK: UITableViewDataSource Methods
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        regionList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = regionList[indexPath.row].name
        cell.detailTextLabel?.text = regionList[indexPath.row].isEntered ? Localizations.Geofence.entered : Localizations.Geofence.exited
        return cell
    }
}

// MARK: GeofenceTrackerDelegate Methods
extension ViewController: GeofenceTrackerDelegate {
    /// The updated region called when region update
    ///
    /// - Parameter region: The list of the region we need to display
    ///
    func updatedRegion(region: [GeofenceRegion]) {
        regionList = region
        geofenceTableView.reloadData()
    }
}
