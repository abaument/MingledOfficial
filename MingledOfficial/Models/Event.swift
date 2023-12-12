//
//  Event.swift
//  MingledOfficial
//
//  Created by arthur baument on 12/12/2023.
//

import Foundation
import MapKit
import SwiftUI

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
