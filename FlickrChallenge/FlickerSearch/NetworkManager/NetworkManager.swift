//
//  NetworkManager.swift
//  FlickrChallenge
//
//  Created by Ganesh on 17/07/23.
//

import Foundation


import UIKit

enum NetworkManagerError: Error {
    case inValidData
    case noData
    case decondingFail
}

class NetworkManager {
    
    static let shared = NetworkManager()
      
    func request(_ request: Request, completion: @escaping (Result<Data, NetworkManagerError>) -> Void) {
    
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            guard error == nil else {
                completion(.failure(.noData))
                return
            }
            
            guard let data = data else {
                completion(.failure(.inValidData))
                return
            }
            completion(.success(data))
        }.resume()
    }
   
}
