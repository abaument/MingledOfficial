//
//  TabBarController.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import SwiftUI

struct TabBarController: View {
    @EnvironmentObject var eventStore: EventStore // Accédez à EventStore pour obtenir events

    var body: some View {
        TabView {
            MapView(events: $eventStore.events)
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
            
            EventView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Event")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}
