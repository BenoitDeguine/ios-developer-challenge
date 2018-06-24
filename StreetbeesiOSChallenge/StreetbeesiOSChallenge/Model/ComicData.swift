//
//  Comic.swift
//  StreetbeesiOSChallenge
//
//  Created by Benoit Deguine on 23/06/2018.
//  Copyright © 2018 Benoit Deguine. All rights reserved.
//

import Foundation

struct ComicData {
    
    let id:Int64
    let title:String
    let description:String?
    let format:String?
    let thumbnail:String?
    let thumbnailExtension:String?
    
}

extension ComicData: JSONDecodable {
    
    init(decoder: JSONDecoder) throws {
        self.id = try decoder.decode(key: "id")
        self.title = try decoder.decode(key: "title")
        self.description = try decoder.decode(key: "description")
        self.format = try decoder.decode(key: "format")
        self.thumbnail = try decoder.decode(key: "thumbnail.path")
        self.thumbnailExtension = try decoder.decode(key: "thumbnail.extension")
    }
    
}
