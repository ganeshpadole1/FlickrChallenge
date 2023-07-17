//
//  FlickrSearchService.swift
//  FlickrChallenge
//
//  Created by Ganesh on 17/07/23.
//

import UIKit

enum SearchError: Error {
    case noData
}

class FlickrSearchService {
    
    func request(_ searchText: String, completion: @escaping (Result<Photos?, SearchError>) -> Void) {
        
        guard let request = FlickrRequestConfig.searchRequest(searchText).value else {
            return
        }
        
        NetworkManager.shared.request(request) { (result) in
            switch result {
            case .success(let response):
                if let model = self.processResponse(response) {
                    if model.stat.uppercased().contains("OK") {
                        return completion(.success(model.photos))
                    } else {
                        return completion(.failure(.noData))
                    }
                } else {
                    return completion(.failure(.noData))
                }
            case .failure(_):
                return completion(.failure(.noData))
            }
        }
    }
    
    func processResponse(_ data: Data) -> FlickrSearchResults? {
        do {
            let responseModel = try JSONDecoder().decode(FlickrSearchResults.self, from: data)
            return responseModel
            
        } catch {
            print("Data parsing error: \(error.localizedDescription)")
            return nil
        }
    }
}
