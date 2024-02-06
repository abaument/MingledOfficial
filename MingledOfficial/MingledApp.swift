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
    @StateObject var userData = UserData()
    @State private var isLoading = true
    
    var body: some Scene {
        WindowGroup {
            if isLoading {
                LoadingView()
                    .onAppear {
                        // Simulez un chargement ou effectuez des tâches initiales
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { //Attend 2 secondes avant de passer à l'écran suivant
                            isLoading = false
                        }
                    }
            } else if userData.isUserLoggedIn {
                MainView(currentUser: $userData.currentUser, isUserLoggedIn: $userData.isUserLoggedIn)
            } else {
                LoginView(userData: userData)
            }
        }
    }
}
