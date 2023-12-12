//
//  MingledApp.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import SwiftUI
import MapKit

@main
struct MingledApp: App {
    @StateObject private var eventStore = EventStore()
    @StateObject var userData = UserData()
    
    var body: some Scene {
        WindowGroup {
            if userData.isUserLoggedIn {
                MainView(currentUser: $userData.currentUser)
            } else {
                LoginView(currentUser: $userData.currentUser, isUserLoggedIn: $userData.isUserLoggedIn)
            }
        }
    }
}
