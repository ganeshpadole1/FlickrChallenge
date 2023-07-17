//
//  Photos.swift
//  FlickrChallenge
//
//  Created by Ganesh on 17/07/23.
//

import Foundation

struct Photos: Decodable {
    let page: Int
    let pages: Int
    let perpage: Int
    let photo: [FlickrPhoto]
    let total: String
}

