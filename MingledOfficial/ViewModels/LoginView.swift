import Foundation
import SwiftUI
import MapKit

struct LoginView: View {
    @State private var email = "Default@example.com"  // Email par défaut
    @State private var password = "password"  // Mot de passe par défaut
    @ObservedObject var userData: UserData

    private let networking = Networking()

    var body: some View {
        VStack {
            Spacer()

            // Logo de l'application
            Image("logo")  // Remplacez "logo" par le nom de votre image de logo
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)

            // Champs de saisie pour l'email et le mot de passe
            // Masqués ou non selon votre choix
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .hidden()  // Cache ce champ

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .hidden()  // Cache ce champ

            // Bouton de connexion
            Button("Login") {
                let defaultUser = User(id: UUID(), username: "DefaultUser", email: self.email)
                self.userData.currentUser = defaultUser
                self.userData.isUserLoggedIn = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            Spacer()
        }
        .padding()
        .onAppear {
            networking.loginUser(email: email, password: password) { user in
                if let user = user {
                    self.userData.currentUser = user
                    self.userData.isUserLoggedIn = true
                    print("Connexion réussie")
                } else {
                    print("échec putain de merde")
                }
            }  // Connexion automatique à l'apparition de la vue
        }
    }

    // Méthode de connexion
    private func loginUser() {
        networking.loginUser(email: email, password: password) { user in
            if let user = user {
                self.userData.currentUser = user
                self.userData.isUserLoggedIn = true
            } else {
                print("Échec de l'authentification")
            }
        }
    }
}
