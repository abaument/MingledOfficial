//
//  LoginView.swift
//  MingledOfficial
//
//  Created by arthur baument on 12/12/2023.
//

import Foundation
import MapKit
import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @Binding var currentUser: User?
    @Binding var isUserLoggedIn: Bool
    
    private let networking = Networking()

    var body: some View {
        VStack {
            Spacer()

        // Logo de l'application (remplacez "logoImageName" par le nom de votre image de logo)
            Image("3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)

            Form {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.top, .horizontal])

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding([.top, .bottom, .horizontal])

                Button("Login") {
                    networking.loginUser(email: email, password: password) { user in
                        if let user = user {
                            self.currentUser = user
                            self.isUserLoggedIn = true
                        } else {
                            print("Échec de l'authentification ")
                        }
                    }
                }
                
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding([.bottom, .horizontal])
            }

            Spacer()
        }
    }
}
