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
        let imageNames = ["pin", "type1", "type2", "type3", "type4", "type5", "type6", "type7"]
        let randomIndex = Int(arc4random_uniform(UInt32(imageNames.count)))
        self.image = UIImage(named: imageNames[randomIndex])
        self.creator = creator
    }
}
