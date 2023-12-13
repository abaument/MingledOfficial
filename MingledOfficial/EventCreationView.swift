//
//  EventCreationView.swift
//  MingledOfficial
//
//  Created by arthur baument on 13/12/2023.
//

import Foundation
import MapKit
import SwiftUI

struct EventCreationView: View {
    @ObservedObject var eventData: EventData
    @State private var title: String = ""
    @State private var description: String = ""
    @Binding var selectedCoordinate: CLLocationCoordinate2D?
    @State private var showingLocationPicker = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                }

                Section {
                    Button("Select Location") {
                        showingLocationPicker = true
                    }
                    .sheet(isPresented: $showingLocationPicker) {
                        LocationPickerView(selectedCoordinate: $selectedCoordinate)
                    }

                    if let coordinate = selectedCoordinate {
                        Text("Location: \(coordinate.latitude), \(coordinate.longitude)")
                    }
                }

                Section {
                    Button("Create Event") {
                        let newEvent = Event(title: title, description: description, coordinate: selectedCoordinate ?? CLLocationCoordinate2D())
                        eventData.events.append(newEvent)
                        presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(selectedCoordinate == nil)
                }
            }
            .navigationBarTitle("New Event", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
