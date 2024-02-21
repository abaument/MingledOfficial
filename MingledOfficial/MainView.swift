import Foundation
import SwiftUI
import MapKit

struct MainView: View {
    @StateObject private var eventData = EventData()
    @StateObject private var userData = UserData()
    @Binding var currentUser: User?
    @Binding var isUserLoggedIn: Bool
    @State private var selectedEvent: Event?
    var body: some View {
        TabView {
            MapView(eventData: eventData, userData: userData, currentUser: $currentUser)
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
            
            EventView(eventData: eventData, selectedEvent: $selectedEvent, userData: userData)
                .tabItem {
                    Label("Events", systemImage: "list.bullet")
                }
            
            ChatView()
                .tabItem {
                    Image(systemName: "message")
                    Text("Chat")
                }
            
            ProfileView(userData: userData, eventData: eventData, isUserLoggedIn: $isUserLoggedIn)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}
