//
//  ProfileTableViewCell.swift
//  VK
//
//  Created by Владимир on 03/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak private var avatarPhotoImage: UIImageView!
    @IBOutlet private var nameTextLabel: UILabel!
    
    private let colorClickedCell = UIColor.init(red: 55/255, green: 55/255, blue: 57/255, alpha: 1)
    
    func configure() {
        let profile = Singleton.instance.profileGU
        nameTextLabel.text = profile.first_name + " " + profile.last_name
    
        avatarPhotoImage.kf.setImage(with: URL(string: profile.photo_100))
        avatarPhotoImage.layer.cornerRadius = avatarPhotoImage.frame.height/2
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = colorClickedCell
        self.selectedBackgroundView = bgColorView
    }
}
