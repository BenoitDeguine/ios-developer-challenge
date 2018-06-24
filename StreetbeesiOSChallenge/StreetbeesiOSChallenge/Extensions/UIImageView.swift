//
//  UIImageView.swift
//  StreetbeesiOSChallenge
//
//  Created by Benoit Deguine on 23/06/2018.
//  Copyright © 2018 Benoit Deguine. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func imageFromServerURL(url: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: url.replacingOccurrences(of: " ", with: "%20"))! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }
}
