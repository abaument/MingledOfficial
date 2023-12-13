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
            Image("Icone2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(1.5, anchor: .center)
            
            Spacer()
        }
        .padding()
        .background(Color.white)
    }
}
