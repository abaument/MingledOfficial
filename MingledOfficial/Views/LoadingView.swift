//
//  LoadingView.swift
//  MingledOfficial
//
//  Created by arthur baument on 13/12/2023.
//

import Foundation
import MapKit
import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Chargement...")
                .font(.headline)
                .foregroundColor(.gray)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(1.5)
            Spacer()
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}
