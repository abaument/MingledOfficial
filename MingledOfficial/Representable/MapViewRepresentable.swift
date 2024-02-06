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
        for event in events  {
            let annotation = EventAnnotation(coordinate: event.coordinate, title: event.title, subtitle: "Created By: \(event.creator)", image: nil, creator: event.creator)
            uiView.addAnnotation(annotation)
        }
        
        if isSelectingLocation, let coordinate = selectedCoordinate {
            let selectionAnnotation = EventAnnotation(coordinate: coordinate, title: "", subtitle: "", image: nil, creator: "")
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
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if let eventAnnotation = annotation as? EventAnnotation {
                let identifier = "EventAnnotation"
                var view: CustomAnnotationView
                if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? CustomAnnotationView {
                    dequeuedView.annotation = eventAnnotation
                    view = dequeuedView
                } else {
                    view = CustomAnnotationView(annotation: eventAnnotation, reuseIdentifier: identifier)
                }
                return view
                }
            return nil
            }

            func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
                guard let annotation = view.annotation as? EventAnnotation else { return }
                if let event = parent.events.first(where: { $0.coordinate.latitude == annotation.coordinate.latitude && $0.coordinate.longitude == annotation.coordinate.longitude}) {
                    parent.selectedEvent = event
                }
        }
        @objc func mapTapped(_ sender: UITapGestureRecognizer) {
            if parent.isSelectingLocation {
                let mapView = sender.view as! MKMapView
                    let locationInView = sender.location(in: mapView)
                    let coordinate = mapView.convert(locationInView, toCoordinateFrom: mapView)
                    parent.selectedCoordinate = coordinate
            }
        }
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            if let selectedEvent = parent.selectedEvent {
                let region = MKCoordinateRegion(center: selectedEvent.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
                   mapView.setRegion(region, animated: true)
            }
        }
    }
}
