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
        VStack(spacing: 20) {
            Image("profilepic")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 4))
            
            Text("Nom d'utilisateur : \(user.username)")
                .font(.title2)
            
            Text("Email : \(user.email)")
                .font(.title3)
            
            Spacer()
        }
        .padding()
    }
}

