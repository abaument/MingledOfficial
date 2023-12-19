import SwiftUI
import MapKit
import Foundation

struct MapViewRepresentable: UIViewRepresentable {
    @Binding var events: [Event]
    @Binding var selectedEvent: Event?
    var isSelectingLocation: Bool
    @Binding var selectedCoordinate: CLLocationCoordinate2D?
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        for event in events {
            let annotation = MKPointAnnotation()
            annotation.coordinate = event.coordinate
            annotation.title = event.title
            uiView.addAnnotation(annotation)
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
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            guard let coordinate = view.annotation?.coordinate else { return }
            parent.selectedEvent = parent.events.first { $0.coordinate.latitude == coordinate.latitude && $0.coordinate.longitude == coordinate.longitude }
        }
        @objc func mapTapped(_ sender: UITapGestureRecognizer) {
            if parent.isSelectingLocation {
                let mapView = sender.view as! MKMapView
                    let locationInView = sender.location(in: mapView)
                    let coordinate = mapView.convert(locationInView, toCoordinateFrom: mapView)
                    parent.selectedCoordinate = coordinate
            }
        }
        
    }
}
