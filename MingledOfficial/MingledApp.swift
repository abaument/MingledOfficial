//
//  MingledApp.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import SwiftUI

@main
struct MingledApp: App {
    @StateObject private var eventStore = EventStore()
    
    
    var body: some Scene {
        WindowGroup {
            TabBarController()
                .environmentObject(eventStore)
        }
    }
}
