//
//  FlickrRequestConfig.swift
//  FlickrChallenge
//
//  Created by Ganesh on 17/07/23.
//

import UIKit

enum FlickrRequestConfig {
    
    case searchRequest(String, Int)
    
    var value: Request? {
        
        switch self {
            
        case .searchRequest(let searchText, let pageNo):
            let urlString = String(format: Constants.searchURL, searchText, pageNo)
            let reqConfig = Request.init(requestMethod: .get, urlString: urlString)
            return reqConfig
        }
    }
}
