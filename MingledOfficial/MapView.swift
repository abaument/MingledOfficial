import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var eventData: EventData
    @State private var showingEventCreationSheet = false

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            MapViewRepresentable(events: $eventData.events, selectedCoordinate: .constant(nil))
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
            .sheet(isPresented: $showingEventCreationSheet) {
                EventCreationView(eventData: eventData)
            }
        }
    }
}
