//
//  ChatView.swift
//  MingledOfficial
//
//  Created by arthur baument on 03/02/2024.
//

import Foundation
import SwiftUI
import MapKit

struct ChatView: View {
    let welcomeMessage = ChatMessage(sender: "Mingled", message: "Bienvenue sur Mingled! Nous sommes ravis de vous avoir parmi nous. 😊", date: Date())
    
    @State private var showingReplyForm = false
    @State private var replyText = ""

    var body: some View {
        List {
            Button(action: {
                self.showingReplyForm = true
            }) {
                ChatMessageView(message: welcomeMessage)
            }
            .sheet(isPresented: $showingReplyForm) {
                ReplyForm(replyText: $replyText)
            }
        }
        .navigationBarTitle("Chat", displayMode: .inline)
    }
}

