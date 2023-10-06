//
//  ServiceManager.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 5.10.2023.
//

import Foundation

final class ServiceManager {
    
    static let shared = ServiceManager()
    
    private init() { }
    
    func request <T:Decodable> (_ endpoint : Endpoint, completion : @escaping (Result<T , Error>) ->Void) {
        
        let task = URLSession.shared.dataTask(with: endpoint.request()) {(data, response, error) in
            if let error = error {
                print(error)
            }
                        
            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(jsonData))
                    
                } catch let error {
                    completion(.failure(error))
                }
            }
            
        }
        task.resume()
    }
}
