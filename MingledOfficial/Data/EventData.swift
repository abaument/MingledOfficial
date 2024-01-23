//
//  Event.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import MapKit
import SwiftUI

class EventData: ObservableObject {
    @Published var events: [Event] = [
        Event(id: UUID(), title: "Event 1", description: "Description 1", latitude: 45.76708, longitude: 4.84157, creator: "Creator 1"),
        Event(id: UUID(), title: "Event 2", description: "Description 2", latitude: 45.76633, longitude: 4.83176, creator: "Creator 2"),
        Event(id: UUID(), title: "Event à Nîmes", description: "Description à Nîmes", latitude: 43.8367, longitude: 4.3601, creator: "Creator Nîmes"),
        Event(id: UUID(), title: "Event à Toulouse", description: "Description à Toulouse", latitude: 43.6047, longitude: 1.4442, creator: "Creator Toulouse"),
           // ... répétez pour les autres événements ...
        Event(id: UUID(), title: "Event à Nice", description: "Description à Nice", latitude: 43.7102, longitude: 7.2620, creator: "Creator Nice"),
        Event(id: UUID(), title: "Event à Montpellier", description: "Description à Montpellier", latitude: 43.6108, longitude: 3.8767, creator: "Creator Montpellier")
           // ... et ainsi de suite jusqu'à 20 événements ...
]
}


