//
//  ResponseData.swift
//  SongsBrowser
//
//  Created by Kamil Chlebuś on 21/10/2017.
//  Copyright © 2017 Kamil Chlebuś. All rights reserved.
//

import Foundation

struct ResponseData: Codable {

    var resultCount: Int
    var results: [Track]

}
