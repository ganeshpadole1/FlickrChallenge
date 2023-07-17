//
//  Constants.swift
//  FlickrChallenge
//
//  Created by Ganesh on 17/07/23.
//

import Foundation

struct Constants {
    static let api_key = "a724969f016f0b8badd7e518a6c48e55"
    static let per_page = 20
    static let searchURL = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(Constants.api_key)&format=json&nojsoncallback=1&safe_search=1&per_page=\(Constants.per_page)&text=%@&page=%ld&extras=url_t"
}
