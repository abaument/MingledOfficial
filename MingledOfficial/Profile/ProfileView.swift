//
//  ProfileView.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @ObservedObject var userData: UserData
    @ObservedObject var eventData: EventData
    @Binding var isUserLoggedIn: Bool

    var body: some View {
        VStack {
            if let user = userData.currentUser {
                ProfileDetailsView(user: user)
                NavigationLink(destination: MyEventsView(userData: userData, eventData: eventData)) {
                    Text("Mes événements")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .padding()

                Button(action: {
                    self.isUserLoggedIn = false
                    // Supposant que vous avez une manière de réinitialiser currentUser dans UserData
                    self.userData.currentUser = nil
                }) {
                    Text("Se déconnecter")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .clipShape(Capsule())
                }
                .padding()
            } else {
                Text("Pas d'utilisateur connecté")
            }
        }
    }
}
