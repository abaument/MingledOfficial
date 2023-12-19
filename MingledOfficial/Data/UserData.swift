//
//  UserData.swift
//  MingledOfficial
//
//  Created by arthur baument on 12/12/2023.
//

import Foundation
import MapKit
import SwiftUI

class UserData: ObservableObject {
    @Published var isUserLoggedIn = false
    @Published var currentUser: User?
}
