//
//  ComicCollectionViewCell.swift
//  StreetbeesiOSChallenge
//
//  Created by Benoit Deguine on 23/06/2018.
//  Copyright © 2018 Benoit Deguine. All rights reserved.
//

import UIKit

class ComicCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var comicThumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(viewModel: ComicViewViewModel) {
        comicThumbnail.imageFromServerURL(url: viewModel.imageURL)
    }

}
