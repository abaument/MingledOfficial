//
//  ProfileDetailsView.swift
//  MingledOfficial
//
//  Created by arthur baument on 12/12/2023.
//

import Foundation
import MapKit
import SwiftUI

struct ProfileDetailsView: View {
    var user: User

    var body: some View {
        VStack {
            Text("Profil de l'utilisateur")
            Text("Nom d'utilisateur : \(user.username)")
            Text("Email : \(user.email)")
            // Ajoutez d'autres détails de profil
        }
    }
}

