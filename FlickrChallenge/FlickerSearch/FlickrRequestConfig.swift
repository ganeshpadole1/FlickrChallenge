//
//  FlickrRequestConfig.swift
//  FlickrChallenge
//
//  Created by Ganesh on 17/07/23.
//

import UIKit

enum FlickrRequestConfig {
    
    case searchRequest(String)
    
    var value: Request? {
        
        switch self {
            
        case .searchRequest(let searchText):
            let urlString = String(format: Constants.searchURL, searchText)
            let reqConfig = Request.init(requestMethod: .get, urlString: urlString)
            return reqConfig
        }
    }
}
