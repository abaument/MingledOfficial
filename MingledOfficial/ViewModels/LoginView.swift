import Foundation
import SwiftUI
import MapKit


struct LoginView: View {
    @State private var email = ""  // Initialiser vide pour une saisie manuelle
    @State private var password = ""  // Initialiser vide pour une saisie manuelle
    @ObservedObject var userData: UserData

    var body: some View {
        VStack {
            Spacer()
            
            // Logo de l'application
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)

            // Champs de saisie pour l'email et le mot de passe
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // Bouton de connexion manuelle
            Button("Login") {
                loginUser()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            // Bouton pour une connexion rapide avec un utilisateur par défaut
            Button("Connexion rapide") {
                loginWithDefaultUser()
            }
            .padding()
            .foregroundColor(.blue)

            Spacer()
        }
        .padding()
    }

    // Méthode pour la connexion manuelle
    private func loginUser() {
        // Ici, vous pouvez ajouter votre logique de vérification des identifiants
        // Pour cet exemple, nous connectons simplement l'utilisateur avec les données saisies
        let user = User(id: UUID(), username: "Username", email: email)
        self.userData.currentUser = user
        self.userData.isUserLoggedIn = true
    }

    // Méthode pour la connexion avec un utilisateur par défaut
    private func loginWithDefaultUser() {
        let defaultUser = User(id: UUID(), username: "UserTest", email: "test@example.com")
        userData.currentUser = defaultUser
        userData.isUserLoggedIn = true
    }
}
