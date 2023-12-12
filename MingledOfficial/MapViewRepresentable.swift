//
//  MapViewRepresentable.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import SwiftUI
import MapKit

struct MapViewRepresentable: UIViewRepresentable {
    @Binding var events: [Event]
    @Binding var selectedCoordinate: CLLocationCoordinate2D?

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.mapTapped(_:)))
        mapView.addGestureRecognizer(tapGesture)
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        
        // Ajoutez des annotations pour les événements existants
        for event in events {
            let annotation = MKPointAnnotation()
            annotation.coordinate = event.coordinate
            annotation.title = event.title
            annotation.subtitle = event.description
            uiView.addAnnotation(annotation)
        }
        
        // Ajoutez une annotation pour l'emplacement sélectionné
        if let coordinate = selectedCoordinate {
            let selectionAnnotation = MKPointAnnotation()
            selectionAnnotation.coordinate = coordinate
            uiView.addAnnotation(selectionAnnotation)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewRepresentable

        init(_ parent: MapViewRepresentable) {
            self.parent = parent
        }

        @objc func mapTapped(_ sender: UITapGestureRecognizer) {
            let mapView = sender.view as! MKMapView
            let locationInView = sender.location(in: mapView)
            let coordinate = mapView.convert(locationInView, toCoordinateFrom: mapView)
            parent.selectedCoordinate = coordinate
        }
    }
}
