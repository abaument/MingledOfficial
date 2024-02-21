//
//  MyEventsView.swift
//  MingledOfficial
//
//  Created by arthur baument on 21/02/2024.
//

import Foundation
import SwiftUI
import MapKit

struct MyEventsView: View {
    @ObservedObject var userData: UserData
    @ObservedObject var eventData: EventData

    var body: some View {
        List {
            ForEach(userData.currentUser?.participatingEvents ?? [], id: \.self) { eventId in
                if let event = eventData.events.first(where: { $0.id == eventId }) {
                    NavigationLink(destination: EventDetailView(event: event, userData: userData)) {
                        Text(event.title)
                    }
                }
            }
        }
        .navigationTitle("Mes événements")
    }
}
