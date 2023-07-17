//
//  FlickrPhoto.swift
//  FlickrChallenge
//
//  Created by Ganesh on 17/07/23.
//

import Foundation

struct FlickrPhoto: Decodable {

    let title: String
    let urlT: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case urlT = "url_t"
    }
}
