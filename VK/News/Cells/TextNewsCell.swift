//
//  TextNewsCell.swift
//  VK
//
//  Created by Vladimir on 01.05.2022.
//  Copyright © 2022 vladimir73. All rights reserved.
//

import UIKit

class TextNewsCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var textLable: UILabel!
    
    // MARK: - Functions
    func configure(with news: NewsObjectItems) {
        textLable.text = news.text
    }
}
