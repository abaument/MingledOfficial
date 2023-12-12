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
        Form {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button("Login") {
                // Implémentez ici la logique de login
                // Par exemple, vérifier les identifiants et mettre à jour `currentUser` et `isUserLoggedIn`
                // Une fois l'utilisateur connecté avec succès, mettez à jour `isUserLoggedIn` à true et `currentUser` avec les informations de l'utilisateur connecté
                if let user = authenticateUser(email: email, password: password) {
                    currentUser = user
                    isUserLoggedIn = true
                }
            }
        }
    }
    private func getUserFromDatabase(email: String, password: String) -> User? {
        // Supposons que vous avez une liste statique d'utilisateurs fictifs pour cet exemple
        let fakeUsers = [
            User(id: UUID(), username: "Utilisateur1", email: "email1@example.com", password: "oui"),
            User(id: UUID(), username: "Utilisateur2", email: "email2@example.com", password: "oui")
        ]
        
        // Vous pouvez remplacer cette logique par l'accès réel à votre base de données
        for user in fakeUsers {
            if user.email == email && user.password == password {
                return user
            }
        }
        
        return nil
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
}
