//
//  FlickrSearchResults.swift
//  FlickrChallenge
//
//  Created by Ganesh on 17/07/23.
//

import Foundation


// MARK: - FlickrSearchResults
struct FlickrSearchResults: Codable {
    let photos: Photos
    let stat: String
}

// MARK: - Photos
struct Photos: Codable {
    let page, pages, perpage, total: Int
    let photo: [FlickrPhoto]
}

// MARK: - Photo
struct FlickrPhoto: Codable {
    let id, owner, secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
    let urlT: String
    let heightT, widthT: Int

    enum CodingKeys: String, CodingKey {
        case id, owner, secret, server, farm, title, ispublic, isfriend, isfamily
        case urlT = "url_t"
        case heightT = "height_t"
        case widthT = "width_t"
    }
}
