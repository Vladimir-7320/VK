//
//  TopNewsCell.swift
//  VK
//
//  Created by Vladimir on 01.05.2022.
//  Copyright © 2022 vladimir73. All rights reserved.
//

import UIKit

class TopNewsCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var publicationTimeLable: UILabel!
    
    // MARK: - Functions
    func configure(newsItems: NewsObjectItems, uVkNews : NewsObject) {
        let sourceID = newsItems.source_id
        let newsGroups = uVkNews.groups.filter { $0.id == -sourceID }.first
        let newsProfiles = uVkNews.profiles.filter { $0.id == sourceID }.first
        
        if newsGroups == nil {
            userNameLable.text = newsProfiles!.last_name + " " + newsProfiles!.first_name
            logoImageView.kf.setImage(with: URL(string: newsProfiles!.photo_50))
        } else {
            userNameLable.text = newsGroups!.name
            logoImageView.kf.setImage(with: URL(string: newsGroups!.photo_50))
        }
        
        logoImageView.layer.cornerRadius = logoImageView.frame.height/2
    }
}
