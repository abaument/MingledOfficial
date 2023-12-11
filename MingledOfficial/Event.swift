//
//  Event.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import MapKit

struct Event: Identifiable, Hashable {
    var id = UUID() // Ajoutez une propriété identifiant unique
    var title: String
    var description: String
    var coordinate: CLLocationCoordinate2D

    static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
