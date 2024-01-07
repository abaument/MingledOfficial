//
//  Event.swift
//  MingledOfficial
//
//  Created by arthur baument on 12/12/2023.
//

import Foundation
import MapKit
import SwiftUI

struct Event: Identifiable, Hashable, Codable {
    var id: UUID
    var title: String
    var description: String
    var latitude: Double
    var longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    var creator: String
}
