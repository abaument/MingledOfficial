import Foundation
import SwiftUI
import MapKit

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
    
    func addUser(user: User, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "\(baseUrl)/users") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let userDictionnary: [String: Any] = ["username": user.username, "email": user.email, "password": user.password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: userDictionnary, options: [])
        
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
        let credentials: [String: Any] = ["email": email, "password": password]
        request.httpBody = try? JSONSerialization.data(withJSONObject: credentials, options: [])

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erreur de connexion: \(error)")
                DispatchQueue.main.async {
                    completion(nil)
                }
                print(String(data: data!, encoding: .utf8) ?? "Pas de données")
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("Code de réponse HTTP: \(httpResponse.statusCode)")
            }
            if let data = data {
                print(String(data: data, encoding: .utf8) ?? "Aucune réponse brute")	
                if let user = try? JSONDecoder().decode(User.self, from: data) {
                    DispatchQueue.main.async {
                        completion(user)
                    }
                } else {
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
