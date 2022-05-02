//
//  FriendsCell.swift
//  VK
//
//  Created by Владимир on 19/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit

class FriendsCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet var friendsImageView: UIImageView!
    @IBOutlet var friendsTextLabel: UILabel!
    
    // MARK: - Vars
    private let colorClickedCell = UIColor.init(red: 55/255, green: 55/255, blue: 57/255, alpha: 1)
    
    // MARK: - Functions
    func configure(friend : FriendObject) {
        let bgColorView = UIView()
        bgColorView.backgroundColor = colorClickedCell
        selectedBackgroundView = bgColorView
        friendsImageView.kf.setImage(with: URL(string: friend.photo_50))
        friendsTextLabel.text = friend.first_name + " " + friend.last_name
        friendsImageView.layer.cornerRadius = friendsImageView.frame.height/2
    }
}
