//
//  EventDetailView.swift
//  MingledOfficial
//
//  Created by arthur baument on 16/01/2024.
//

import Foundation
import MapKit
import SwiftUI

struct EventDetailView: View {
    var event: Event
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var userData: UserData
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(event.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Organisé par \(event.creator)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                if let eventDate = event.eventDate {
                    Text("Date: \(eventDate, formatter: dateFormatter)")
                        .font(.body)
                }
                
                Text("Description:")
                    .font(.headline)
                Text(event.description)
                    .font(.body)
                
                if !event.locationDescription.isEmpty {
                    Text("À propos de l'emplacement:")
                        .font(.headline)
                    Text(event.locationDescription)
                        .font(.body)
                }
                
                if !event.feedback.isEmpty {
                    Text("Feedback:")
                        .font(.headline)
                    ForEach(event.feedback, id: \.self) { feedback in
                        Text(feedback)
                            .font(.body)
                    }
                }
                
                Text("Capacité: \(event.capacity) personnes")
                    .font(.body)
                
                if !event.practicalInfo.isEmpty {
                    Text("Infos pratiques:")
                        .font(.headline)
                    Text(event.practicalInfo)
                        .font(.body)
                }
                
                if !event.photos.isEmpty {
                    Text("Photos de l'événement:")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(event.photos, id: \.self) { photoPath in
                                // Ici, vous chargeriez l'image depuis le chemin de fichier
                                // Pour cet exemple, nous affichons simplement un placeholder
                                Image("placeholderImage")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 200)
                            }
                        }
                    }
                }
                Button("Participer") {
                    userData.participateInEvent(eventId: event.id)
                    presentationMode.wrappedValue.dismiss()
                    
                                   
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)

            }
                .padding()
        }
        .navigationTitle("Détails de l'événement")
    }
        
    private func loadImageFromPath(_ path: String) -> Image {
            
        return Image("placeholderImage")
    }
}

// Créez un dateFormatter pour afficher la date de l'événement
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .short
    return formatter
}()

// Assurez-vous que votre structure Event peut gérer tous ces champs
// Notamment les photos qui pourraient être des chemins de fichiers ou des URLs
