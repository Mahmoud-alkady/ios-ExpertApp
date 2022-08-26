//
//  UIImageView+Extension.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func loadImage(_ urlString: String?) {
        let imagePlaceholder = UIImage(named: "placeholder")
        if let urlString = urlString, let url = URL(string: urlString) {
            self.sd_setImage(with: url, placeholderImage: imagePlaceholder) { (image, error, cacheType, url) -> Void in
                if error != nil {
                    self.image = imagePlaceholder
                }
            }
            return
        }
        self.image = imagePlaceholder
    }
}
