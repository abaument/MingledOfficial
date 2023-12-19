//
//  User.swift
//  MingledOfficial
//
//  Created by arthur baument on 12/12/2023.
//

import Foundation
import SwiftUI
import MapKit

struct User: Identifiable, Decodable {
    var id: UUID
    var username: String
    var email: String
    var password: String
    // Ajoutez d'autres informations selon vos besoins

    // Assurez-vous que 'UUID' est géré correctement lors de la décodage.
}
