//
//  Geofence.swift
//  GeofenceCaseStudy
//
//  Created by Atul Gawali on 20/07/21.
//

import Foundation

struct GeofenceRegion {
    let id: String
    var isEntered: Bool
    let latitude: Double
    let longitude: Double
    let name: String
    let radius: Int32
}

extension GeofenceRegion {
    var debugDescription: String {
        "\(self) Represent the GeofenceRegion with \"\(self.id)\" and is entered flag \"\(self.isEntered)\""
    }
}
