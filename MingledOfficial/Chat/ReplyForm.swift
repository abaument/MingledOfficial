//
//  ReplyForm.swift
//  MingledOfficial
//
//  Created by arthur baument on 03/02/2024.
//

import Foundation
import MapKit
import SwiftUI

struct ReplyForm: View {
    @Binding var replyText: String
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Écrivez votre réponse ici...", text: $replyText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Envoyer") {
                    print("Réponse envoyée: \(replyText)")
                    // Ici, vous pourriez ajouter la logique pour traiter la réponse.
                    // Pour cet exemple, nous allons juste imprimer la réponse.
                }
                .padding()
                .disabled(replyText.isEmpty)
            }
            .navigationBarTitle("Répondre à Mingled", displayMode: .inline)
        }
    }
}

