import Foundation
import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var eventData: EventData

    @State private var events: [Event] = []
    @State private var isAddingEvent = false

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            MapViewRepresentable(events: $events, selectedCoordinate: .constant(nil))
                .edgesIgnoringSafeArea(.all)

            Button(action: {
                isAddingEvent = true
            }) {
                Image(systemName: "plus")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
            }
            .padding()
        }
        .sheet(isPresented: $isAddingEvent) {
            EventCreationView(events: $events)
        }
    }
}



