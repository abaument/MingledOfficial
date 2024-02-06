//
//  ChatMessage.swift
//  MingledOfficial
//
//  Created by arthur baument on 03/02/2024.
//

import Foundation
import SwiftUI
import MapKit

struct ChatMessage: Identifiable, Hashable {
    var id = UUID()
    var sender: String
    var message: String
    var date: Date 
}
