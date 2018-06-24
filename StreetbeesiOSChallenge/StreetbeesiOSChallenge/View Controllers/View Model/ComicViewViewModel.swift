//
//  ComicViewViewModel.swift
//  StreetbeesiOSChallenge
//
//  Created by Benoit Deguine on 23/06/2018.
//  Copyright © 2018 Benoit Deguine. All rights reserved.
//

import Foundation

struct ComicViewViewModel {

    let comicData: ComicData
    
    var imageURL: String {
        
        guard let thumbnail = comicData.thumbnail, let thumbnailExtension = comicData.thumbnailExtension else {
            return ""
        }
        return thumbnail + "." + thumbnailExtension
    }
    
}
