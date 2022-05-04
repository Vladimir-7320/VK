//
//  ImageNewsCell.swift
//  VK
//
//  Created by Vladimir on 01.05.2022.
//  Copyright © 2022 vladimir73. All rights reserved.
//

import UIKit

class ImageNewsCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var photoImageView: UIImageView!
    
    // MARK: - Functions
    func configure(newsItems: NewsObjectItems) {
        photoImageView.kf.setImage(with: URL(string: newsItems.photoUrl))
    }
}
