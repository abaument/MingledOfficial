import Foundation
import SwiftUI
import MapKit

struct UserFormData: Codable {
    var username: String
    var email: String
    var password: String
}

class Networking {
    let baseUrl = "http://localhost:3000"
    
    func fetchEvents(completion: @escaping ([Event]) -> Void) {
        guard let url = URL(string: "\(baseUrl)/events") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("erreur evenements: \(error)")
                return
            }
            
            if let data = data, let events = try? JSONDecoder().decode([Event].self, from: data) {
                DispatchQueue.main.async {
                    completion(events)
                }
            }
        }.resume()
    }
    func addEvent(event: Event, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "\(baseUrl)/events") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let eventDictionary: [String: Any] = ["title": event.title, "description": event.description, "latitude": event.latitude, "longitude": event.longitude]
        request.httpBody = try? JSONSerialization.data(withJSONObject: eventDictionary, options: [])
        
        URLSession.shared.dataTask(with: request) { (_, _, error) in
            DispatchQueue.main.async {
                completion(error == nil)
            }
        }.resume()
    }
    func fetchUsers(completion: @escaping ([User]) -> Void) {
        guard let url = URL(string: "\(baseUrl)/users") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("erreur pour user \(error)")
                return
            }
            
            if let data = data, let users = try? JSONDecoder().decode([User].self, from: data) {
                DispatchQueue.main.async {
                    completion(users)
                }
            }
        }.resume()
    }
    
    func addUser(userFormData: UserFormData, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "\(baseUrl)/users") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = try? JSONEncoder().encode(userFormData)
        
        URLSession.shared.dataTask(with: request) { (_, _, error) in
            DispatchQueue.main.async {
                completion(error == nil)
            }
        }.resume()
    }
    func loginUser(email: String, password: String, completion: @escaping (User?) -> Void) {
        guard let url = URL(string: "\(baseUrl)/users/login") else { return } // Assurez-vous que l'URL correspond à votre endpoint de connexion
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let credentials = ["email": email, "password": password]
        request.httpBody = try? JSONEncoder().encode(credentials)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erreur de connexion: \(error)")
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            if let data = data {
                print("Réponse brute: \(String(data: data, encoding: .utf8) ?? "Aucune réponse brute")")
                if let user = try? JSONDecoder().decode(User.self, from: data) {
                    DispatchQueue.main.async {
                        completion(user)
                    }
                } else {
                    print("Échec du décodage de l'utilisateur")
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
}
