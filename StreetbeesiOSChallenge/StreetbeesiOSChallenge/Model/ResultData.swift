//
//  ResultData.swift
//  StreetbeesiOSChallenge
//
//  Created by Benoit Deguine on 23/06/2018.
//  Copyright © 2018 Benoit Deguine. All rights reserved.
//

import Foundation


struct ResultData {
    var comics: [ComicData]
    let count:Int
    let copyright:String
}

extension ResultData: JSONDecodable {
    
    init(decoder: JSONDecoder) throws {
        self.copyright = try decoder.decode(key: "copyright")
        self.count = try decoder.decode(key: "data.count")
        self.comics = try decoder.decode(key: "data.results")
        
    }
    
}
