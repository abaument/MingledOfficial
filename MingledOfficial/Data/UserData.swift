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
    
    init() {
        self.isUserLoggedIn = true
        self.currentUser = User(id: UUID(), username: "Arthur Baument", email: "arthurbaument@gmail.com", participatingEvents: [])
    }
    func participateInEvent(eventId: UUID) {
        guard let currentIndex = self.currentUser?.participatingEvents.firstIndex(where: { $0 == eventId }) else {
            self.currentUser?.participatingEvents.append(eventId)
            return
        }
    }
}



