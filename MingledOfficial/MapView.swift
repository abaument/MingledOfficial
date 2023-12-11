//
//  MapView.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var events: [Event]
    func makeUIView(context: Context) -> MKMapView {
        MKMapView() // Créez une instance de MKMapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Mise à jour de la vue de la carte ici, par exemple, la position initiale de la carte.
    }
    func addAnnotationsToMap(mapView: MKMapView) {
            for event in events {
                let annotation = MKPointAnnotation()
                annotation.coordinate = event.coordinate
                annotation.title = event.title
                annotation.subtitle = event.description
                mapView.addAnnotation(annotation)
            }
        }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        let eventStore = EventStore() // Créez une instance factice d'EventStore
        return MapView(events: .constant([])) // Passez une liste vide (ou une liste factice) pour la prévisualisation
            .environmentObject(eventStore) // Injectez eventStore dans l'environnement
    }
}


