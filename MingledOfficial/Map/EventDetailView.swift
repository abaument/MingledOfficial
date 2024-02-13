//
//  EventDetailView.swift
//  MingledOfficial
//
//  Created by arthur baument on 16/01/2024.
//

import Foundation
import MapKit
import SwiftUI

struct EventDetailView: View {
    var event: Event
    
    var body: some View {
        VStack {
            Text(event.title)
                .font(.title)
            Text(event.description)
                .font(.body)
            Text(event.creator)
                .font(.body)
            
        }
    }
}
