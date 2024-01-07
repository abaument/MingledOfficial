//
//  CustomAnnotationView.swift
//  MingledOfficial
//
//  Created by arthur baument on 03/01/2024.
//

import Foundation
import MapKit
import UIKit

class CustomAnnotationView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let customAnnotation = newValue as? EventAnnotation else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            leftCalloutAccessoryView = UIImageView(image: customAnnotation.image)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            image = customAnnotation.image
        }
    }
}
