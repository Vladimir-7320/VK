//
//  ProfileCell.swift
//  VK
//
//  Created by Владимир on 25/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    @IBOutlet weak var profileAvatarImageView: UIImageView!
    @IBOutlet var profileNameTextLabel: UILabel!
    @IBOutlet var profileOnlineTextLabel: UILabel!
    @IBOutlet var profileBearTextLabel: UILabel!
    @IBOutlet var profileCityTextLabel: UILabel!
    @IBOutlet var profileSexTextLabel: UILabel!
    
    func configure() {
        let profile = Singleton.instance.profileGU
        profileAvatarImageView.kf.setImage(with: URL(string: profile.photo_100))
        profileAvatarImageView.layer.cornerRadius = profileAvatarImageView.frame.height/2
        profileNameTextLabel.text = profile.first_name + " " + profile.last_name
        profileOnlineTextLabel.text = profile.online == 0 ? "Online" : "Offline"
        profileBearTextLabel.text = "Дата рождения " + profile.bdate
        profileCityTextLabel.text = profile.countryTitle + ", " + profile.cityTitle
        
        if profile.sex == 1 {
            profileSexTextLabel.text = "Пол: Женщина"
        } else if profile.sex == 2 {
            profileSexTextLabel.text = "Пол: Мужчина"
        }
    }
}
