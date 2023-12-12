//
//  TabBarController.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import SwiftUI

struct MainView: View {
    @StateObject private var eventData = EventData()
    @Binding var currentUser: User?
    var body: some View {
        TabView {
            MapView(eventData: eventData)
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
            
            EventView(eventData: eventData)
                .tabItem {
                    Label("Events", systemImage: "list.bullet")
                }
            
            ProfileView(currentUser: $currentUser)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}
