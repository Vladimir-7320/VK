//
//  PhotoCollectionCell.swift
//  VK
//
//  Created by Владимир on 19/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCollectionCell: UICollectionViewCell {
    @IBOutlet var photoImageView: UIImageView!
    
    func configure(photo: PhotoObject) {
        photoImageView.kf.setImage(with: URL(string: photo.photo_604))
    }
}
