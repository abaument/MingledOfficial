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
    @Binding var selectedEvent: Event?
    @ObservedObject var userData: UserData
    
    var body: some View {
        List(eventData.events) { event in
            Button(event.title) {
                self.selectedEvent = event
            }
        }
        .sheet(item: $selectedEvent) { event in
            EventDetailView(event: event, userData: userData)
        }
    }
}
