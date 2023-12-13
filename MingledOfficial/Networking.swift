//
//  Networking.swift
//  MingledOfficial
//
//  Created by arthur baument on 13/12/2023.
//

import Foundation

struct AppEvent: Codable {
    let title: String
    let description: String
    let coordinate: Coordinate
}

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
}

class Networking {
    func fetchEvents(completion: @escaping ([AppEvent]) -> Void) {
        guard let url = URL(string: "http://localhost:3000/event") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error with fetching events: \(error)")
                return
            }
            if let data = data, let events = try? JSONDecoder().decode([AppEvent].self, from: data) {
                DispatchQueue.main.async {
                }
            }
        }.resume()
    }
}
