//
//  ContentView.swift
//  MingledOfficial
//
//  Created by arthur baument on 13/12/2023.
//

import Foundation
import SwiftUI
import MapKit

struct ContentView: View {
    @State private var isLoading = true
    @State private var currentUser: User? = nil
    @State private var isUserLoggedIn = false
    
    var body: some View {
        Group {
            if isLoading {
                LoadingView()
            } else {
                LoginView(currentUser: $currentUser, isUserLoggedIn: $isUserLoggedIn)
            }
        }
        .onAppear {
            // Démarrer un timer pour changer isLoading après un délai
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                isLoading = false
            }
        }
    }
}
