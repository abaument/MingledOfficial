import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var eventData: EventData
    @ObservedObject var userData: UserData
    @Binding var currentUser: User?
    @State private var showingEventCreationSheet = false
    @State private var selectedEvent: Event?
    @State private var showingEventDetails = false
    @State private var selectedCoordinate: CLLocationCoordinate2D? = nil
    var body: some View {
        ZStack {
            // Contenu principal de la carte
            VStack {
                MapViewRepresentable(events: $eventData.events, selectedEvent: $selectedEvent, isSelectingLocation: false, selectedCoordinate: .constant(nil))
                    .edgesIgnoringSafeArea(.all)

                Spacer() // Ce Spacer pousse la bande en bas

                // Bande blanche
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 20) // Hauteur de la bande blanche
            }

            // Bouton et autres éléments flottants
            VStack {
                Spacer()

                if showingEventDetails, let event = selectedEvent {
                    eventDetailsView(event)
                        .padding(.bottom, 60) // Ajuster en fonction de la hauteur de la bande
                }

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
                .sheet(isPresented: $showingEventCreationSheet) {
                    EventCreationView(eventData: eventData, selectedCoordinate: $selectedCoordinate)
                }
            }
        }
        .sheet(item : $selectedEvent) {event in
            EventDetailView(event: event, userData: userData)
        }
    }

    private func eventDetailsView(_ event: Event) -> some View {
        VStack {
            Text("Event: \(event.title)")
            Text("Description: \(event.description)")
            Text("Location: \(event.latitude), \(event.longitude)")
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
