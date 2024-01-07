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

    func addEvent(title: String, description: String, coordinate: CLLocationCoordinate2D, creator: String) {
        let newEvent = Event(id: UUID(), title: title, description: description, latitude: coordinate.latitude, longitude: coordinate.longitude, creator: creator)
        events.append(newEvent)
    }
}
