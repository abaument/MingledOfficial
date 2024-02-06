//
//  ChatMessageView.swift
//  MingledOfficial
//
//  Created by arthur baument on 03/02/2024.
//

import Foundation
import SwiftUI
import MapKit

struct ChatMessageView: View {
    var message: ChatMessage
    
    var body: some View {
        HStack {
            Image("type5") // Remplacez "nomDeVotreImage" par le nom de votre image dans Assets.xcassets
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40) // Ajustez la taille selon vos besoins
                        
            VStack(alignment: .leading) {
                Text(message.sender)
                    .font(.headline)
                    .bold()
                    .foregroundColor(.black)
                Text(message.message)
                    .font(.body)
                    .bold()
                Text("\(message.date, formatter: dateFormatter)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()

