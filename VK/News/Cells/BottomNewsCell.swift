//
//  BottomNewsCell.swift
//  VK
//
//  Created by Vladimir on 01.05.2022.
//  Copyright © 2022 vladimir73. All rights reserved.
//

import UIKit

class BottomNewsCell: UITableViewCell {
    // MARK: - IBOutlet
    // Like
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var countLikesLable: UILabel!
    // Сomments
    @IBOutlet private weak var commentsButton: UIButton!
    @IBOutlet private weak var countCommentsLable: UILabel!
    // Repost
    @IBOutlet private weak var repostButton: UIButton!
    @IBOutlet private weak var countRepostLable: UILabel!
    // Views
    @IBOutlet private weak var viewsImageView: UIImageView!
    @IBOutlet private weak var countViewsLable: UILabel!
    
    // MARK: - Functions
    func configure(with news: NewsObjectItems) {
        countLikesLable.text = "\(news.likesCount)"
        countCommentsLable.text = "\(news.commentsCount)"
        countRepostLable.text = "\(news.repostsCount)"
        countViewsLable.text = "\(news.viewsCount)"
    }
}
