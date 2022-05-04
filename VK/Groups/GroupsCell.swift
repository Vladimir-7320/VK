//
//  GroupsCell.swift
//  VK
//
//  Created by Владимир on 19/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit

class GroupsCell: UITableViewCell {
    // MARK: - IBOutlet
    @IBOutlet var groupsImageView: UIImageView!
    @IBOutlet var groupsTextLabel: UILabel!
    @IBOutlet var groupsValueTextLabel: UILabel!
    
    // MARK: - IBOutlet
    private let colorClickedCell = UIColor.init(red: 50/255, green: 50/255, blue: 52/255, alpha: 1)
    
    // MARK: - Functions
    func configure(group: GroupObject) {
        let bgColorView = UIView()
        bgColorView.backgroundColor = colorClickedCell
        selectedBackgroundView = bgColorView
        
        groupsImageView.kf.setImage(with: URL(string: group.photo_50))
        groupsImageView.layer.cornerRadius = groupsImageView.frame.height/2
        groupsTextLabel.text = group.name
        groupsValueTextLabel.text = group.is_closed == 0 ? "Открытая группа" : "Закрытая группа"
    }
}
