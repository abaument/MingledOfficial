//
//  Event.swift
//  MingledOfficial
//
//  Created by arthur baument on 12/12/2023.
//

import Foundation
import MapKit
import SwiftUI

class Event: Identifiable, Codable {
    var id: UUID
    var title: String
    var description: String
    var latitude: Double
    var longitude: Double
    var creator: String
    var photos: [String] // Supposez que vous stockez les chemins ou URLs des images
    var locationDescription: String
    var feedback: [String] // Liste des avis
    var capacity: Int
    var practicalInfo: String
    var eventDate: Date

    init(id: UUID, title: String, description: String, latitude: Double, longitude: Double, creator: String, photos: [String], locationDescription: String, feedback: [String], capacity: Int, practicalInfo: String, eventDate: Date) {
        self.id = id
        self.title = title
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
        self.creator = creator
        self.photos = photos
        self.locationDescription = locationDescription
        self.feedback = feedback
        self.capacity = capacity
        self.practicalInfo = practicalInfo
        self.eventDate = eventDate
    }
}
