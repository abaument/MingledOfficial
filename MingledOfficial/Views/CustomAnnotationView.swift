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
            guard let eventAnnotation = newValue as? EventAnnotation else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            if let image = eventAnnotation.image {
                self.image = image
            } else {
                // Ici, vous pouvez définir une image par défaut si nécessaire
                self.image = UIImage(named: "pin")
            }
            // Configurez ici tout autre élément d'UI spécifique à votre annotation
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        // Autres configurations initiales si nécessaire
    }
}
