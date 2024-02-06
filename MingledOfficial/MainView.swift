//
//  TabBarController.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import SwiftUI
import MapKit

struct MainView: View {
    @StateObject private var eventData = EventData()
    @Binding var currentUser: User?
    @Binding var isUserLoggedIn: Bool
    @State private var selectedEvent: Event?
    var body: some View {
        TabView {
            MapView(eventData: eventData, currentUser: $currentUser)
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
            
            EventView(eventData: eventData, selectedEvent: $selectedEvent)
                .tabItem {
                    Label("Events", systemImage: "list.bullet")
                }
            
            ChatView()
                .tabItem {
                    Image(systemName: "message")
                    Text("Chat")
                }
            
            ProfileView(currentUser: $currentUser, isUserLoggedIn: $isUserLoggedIn)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}
