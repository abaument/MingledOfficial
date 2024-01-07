//
//  EventAnnotation.swift
//  MingledOfficial
//
//  Created by arthur baument on 03/01/2024.
//

import Foundation
import MapKit
import UIKit

class EventAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var image: UIImage?
    var creator: String
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, image: UIImage?, creator: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.creator = creator
    }
}
