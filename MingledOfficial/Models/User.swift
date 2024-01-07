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
}
