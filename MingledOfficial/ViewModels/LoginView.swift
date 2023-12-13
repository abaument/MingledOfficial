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

    var body: some View {
        VStack {
            Spacer()

        // Logo de l'application (remplacez "logoImageName" par le nom de votre image de logo)
            Image("logoImageName")
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
                    if let user = authenticateUser(email: email, password: password) {
                        currentUser = user
                        isUserLoggedIn = true
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
        // Fonction pour authentifier l'utilisateur (à personnaliser selon votre logique d'authentification)
        private func authenticateUser(email: String, password: String) -> User? {
            // Insérez ici votre logique d'authentification, par exemple, vérification des identifiants dans une base de données
            // Si l'authentification réussit, renvoyez l'objet User correspondant, sinon renvoyez nil

            // Supposons que vous avez une fonction getUserFromDatabase qui vérifie les identifiants et renvoie un objet User en cas de succès
        if let user = getUserFromDatabase(email: email, password: password) {
            return user
        }
        return nil
    }
    private func getUserFromDatabase(email: String, password: String) -> User? {
        // Supposons que vous avez une liste statique d'utilisateurs fictifs pour cet exemple
        let fakeUsers = [
            User(id: UUID(), username: "Utilisateur1", email: "Email1@example.com", password: "oui"),
            User(id: UUID(), username: "Utilisateur2", email: "Email2@example.com", password: "oui")
        ]
        
        // Vous pouvez remplacer cette logique par l'accès réel à votre base de données
        for user in fakeUsers {
            if user.email == email && user.password == password {
                return user
            }
        }
        
        return nil
    }
}

