//
//  NewsCell.swift
//  VK
//
//  Created by Владимир Харитонов on 26.07.2020.
//  Copyright © 2020 Mediasoft. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    // Top
    @IBOutlet weak var userPhotoImageView: UIImageView!
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var publicationTimeLable: UILabel!
    // Center
    @IBOutlet private weak var newsTextLable: UILabel!
    @IBOutlet weak var newsPhotoImageView: UIImageView!
    // Bottom
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
    
    func configure (with news: NewsObjectItems, newsItems: NewsObjectItems, uVkNews : NewsObject) {
        let sourceID = newsItems.source_id
        let newsGroups = uVkNews.groups.filter { $0.id == -sourceID }.first
        let newsProfiles = uVkNews.profiles.filter { $0.id == sourceID }.first
        
        newsPhotoImageView.kf.setImage(with: URL(string: newsItems.photoUrl))
        
        if newsGroups == nil {
            userNameLable.text = newsProfiles!.last_name + " " + newsProfiles!.first_name
            userPhotoImageView.kf.setImage(with: URL(string: newsProfiles!.photo_50))
        } else {
            userNameLable.text = newsGroups!.name
            userPhotoImageView.kf.setImage(with: URL(string: newsGroups!.photo_50))
        }
        
        newsTextLable.text = news.text
        countLikesLable.text = "\(news.likesCount)"
        countCommentsLable.text = "\(news.commentsCount)"
        countRepostLable.text = "\(news.repostsCount)"
        countViewsLable.text = "\(news.viewsCount)"
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.height/2
    }
}
