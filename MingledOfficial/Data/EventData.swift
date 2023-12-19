//
//  Event.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import MapKit
import SwiftUI

class EventData: ObservableObject {
    @Published var events: [Event] = []
}


