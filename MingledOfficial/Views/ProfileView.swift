//
//  ProfileView.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @Binding var currentUser: User?
    @Binding var isUserLoggedIn: Bool
    
    var body: some View {
        VStack {
            if let user = currentUser {
                ProfileDetailsView(user: user)
                
                Button(action: {
                    self.isUserLoggedIn = false
                    self.currentUser = nil
                }) {
                    Text("Se deconnecter")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .clipShape(Capsule())
                }
                .padding()
            }
        }
    }
}
