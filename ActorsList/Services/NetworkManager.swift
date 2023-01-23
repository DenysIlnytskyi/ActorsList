//
//  NetworkService.swift
//  44444
//
//  Created by Денис Ільницький on 20/01/2023.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with completion: @escaping(ActorsList) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = ["APIKey": "1ff7e612-52ec-4bf0-899a-3bb29b07a43c"]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let actors = try JSONDecoder().decode(ActorsList.self, from: data)
                print("SUCCESS")
                DispatchQueue.main.async {
                    completion(actors)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
}



