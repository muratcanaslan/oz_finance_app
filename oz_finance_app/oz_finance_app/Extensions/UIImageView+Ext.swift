//
//  UIImageView+Ext.swift
//  oz_finance_app
//
//  Created by Murat Can ASLAN on 6.10.2023.
//

import SDWebImage
import SDWebImageSVGCoder

extension UIImageView {
    
    func downloadedFrom(url: URL, completion: ((UIImage?) -> Void)? = nil) {
        if url.pathExtension == "svg" {
            sd_setImage(with: url, placeholderImage: nil, context: [.imageCoder: ImageSVGDecoder(fallbackDecoder: SDImageSVGCoder.shared)])
        } else {
            sd_setImage(with: url, placeholderImage: nil)
        }
    }
}


