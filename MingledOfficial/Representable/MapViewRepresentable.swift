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
            let annotation = EventAnnotation(
                coordinate: event.coordinate,
                title: event.title,
                subtitle: "Crée par: \(event.creator)",
                image: UIImage(named: "customPinImage"),
                creator: event.creator
            )
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
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
                guard let eventAnnotation = annotation as? EventAnnotation else { return nil }
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

            func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
                guard let eventAnnotation = view.annotation as? EventAnnotation else { return }
                parent.selectedEvent = parent.events.first {
                    $0.coordinate.latitude == eventAnnotation.coordinate.latitude &&
                    $0.coordinate.longitude == eventAnnotation.coordinate.longitude
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
        
    }
}