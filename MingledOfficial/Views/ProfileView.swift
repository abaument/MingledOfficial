//
//  ProfileView.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @Binding var currentUser: User?
    var body: some View {
        if let user = currentUser {
                ProfileDetailsView(user: user)
        }
    }
}
