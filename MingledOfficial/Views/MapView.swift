import SwiftUI
import MapKit
import Foundation   

struct MapView: View {
    @ObservedObject var eventData: EventData
    @State private var showingEventCreationSheet = false
    @State private var selectedEvent: Event?
    @State private var showingEventDetails = false
    @State private var selectedCoordinate: CLLocationCoordinate2D? = nil// Ajouté
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            MapViewRepresentable(events: $eventData.events, selectedEvent: $selectedEvent, isSelectingLocation: false, selectedCoordinate: .constant(nil))
                .edgesIgnoringSafeArea(.all)

            Button(action: {
                showingEventCreationSheet = true
            }) {
                Image(systemName: "plus")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            .padding()

            if showingEventDetails, let event = selectedEvent {
                eventDetailsView(event)
            }
        }
        .sheet(isPresented: $showingEventCreationSheet) {
            EventCreationView(eventData: eventData, selectedCoordinate: $selectedCoordinate)
        }
    }

    private func eventDetailsView(_ event: Event) -> some View {
        VStack {
            Text("Event: \(event.title)")
            Text("Description: \(event.description)")
            Text("Location: \(event.coordinate.latitude), \(event.coordinate.longitude)")
            Button("Close") {
                showingEventDetails = false
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
