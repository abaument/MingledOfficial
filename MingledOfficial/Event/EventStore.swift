//
//  EventStore.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import SwiftUI
import MapKit

class EventStore: ObservableObject {
    @Published var events: [Event] = []

    func addEvent(title: String, description: String, latitude: Double, longitude: Double, creator: String, photos: [String], locationDescription: String, feedback: [String], capacity: Int, practicalInfo: String, eventDate: Date) {
        let newEvent = Event(id: UUID(), title: title, description: description, latitude: latitude, longitude: longitude, creator: creator, photos: photos, locationDescription: locationDescription, feedback: feedback, capacity: capacity, practicalInfo: practicalInfo, eventDate: eventDate)
        events.append(newEvent)
    }
}
