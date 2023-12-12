//
//  EventView.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import SwiftUI
import MapKit

struct EventView: View {
    @ObservedObject var eventData: EventData

    var body: some View {
        List(eventData.events) { event in
            VStack(alignment: .leading) {
                Text(event.title).font(.headline)
                Text(event.description).font(.subheadline)
                Text("Latitude: \(event.coordinate.latitude), Longitude: \(event.coordinate.longitude)")
            }
        }
    }
}

