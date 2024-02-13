//
//  LocationPickerView.swift
//  MingledOfficial
//
//  Created by arthur baument on 11/12/2023.
//

import Foundation
import SwiftUI
import MapKit

struct LocationPickerView: View {
    @Binding var selectedCoordinate: CLLocationCoordinate2D?
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            LocationPickerMapViewRepresentable(selectedCoordinate: $selectedCoordinate)
                .edgesIgnoringSafeArea(.all)
            
            Button("Confirm Location") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}
