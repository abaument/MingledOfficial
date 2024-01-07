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
    @StateObject var userData = UserData()
    @State private var isLoading = true
    
    var body: some View {
        Group {
            if isLoading {
                LoadingView()
            } else {
                LoginView(userData: userData)
            }
        }
        .onAppear {
            // Démarrer un timer pour changer isLoading après un délai
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // 3 secondes de délai
                isLoading = false
            }
        }
    }
}
