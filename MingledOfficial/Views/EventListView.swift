//
//  EventListView.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import SwiftUI

struct EventListView: View {
    var events: [Event]

    var body: some View {
        List(events, id: \.title) { event in
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.headline)
                Text(event.description)
                    .font(.subheadline)
                
            }
        }
    }
}
