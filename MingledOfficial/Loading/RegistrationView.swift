//
//  RegistrationView.swift
//  MingledOfficial
//
//  Created by arthur baument on 20/12/2023.
//

import Foundation
import MapKit
import SwiftUI

struct RegistrationView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""

    private let networking = Networking()

    var body: some View {
        Form {
            TextField("Username", text: $username)
            TextField("Email", text: $email)
            SecureField("Password", text: $password)

            Button("Register") {
                let newUser = UserFormData(username: username, email: email, password: password)
                networking.addUser(userFormData: newUser) { success in
                    // Gérer la réponse (par exemple, naviguer vers une autre vue)
                }
            }
        }
    }
}

