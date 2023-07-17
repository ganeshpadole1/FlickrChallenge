//
//  FlickrViewModel.swift
//  FlickrChallenge
//
//  Created by Ganesh on 17/07/23.
//

import Foundation

class FlickrViewModel: NSObject {
    
    private(set) var photoArray = [FlickrPhoto]()
    private var searchText = ""
    private var totalPageNo = 1
    
    var showAlert: ((String) -> Void)?
    var dataUpdated: (() -> Void)?
    
    func search(text: String, completion:@escaping () -> Void) {
        searchText = text
        photoArray.removeAll()
        fetchResults(completion: completion)
    }
    
    private func fetchResults(completion:@escaping () -> Void) {
        
        FlickrSearchService().request(searchText) { (result) in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    if let result = results {
                        self.totalPageNo = result.pages
                        self.photoArray.append(contentsOf: result.photo)
                        self.dataUpdated?()
                    }
                    completion()
                case .failure(let message):
                    //self.showAlert?(message)
                    completion()
                }
            }
        }
    }
}

