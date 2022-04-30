//
//  HomeTableViewCell.swift
//  VK
//
//  Created by Владимир on 02/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var photoMenuImage: UIImageView!
    @IBOutlet weak var textLabelCell: UILabel!
    
    private let colorClickedCell = UIColor.init(red: 50/255, green: 50/255, blue: 52/255, alpha: 1)
    
    func configure(home: HomeViewController.MenuItem) {
        let bgColorView = UIView()
        bgColorView.backgroundColor = colorClickedCell
        self.selectedBackgroundView = bgColorView
        textLabelCell.text = home.title
        photoMenuImage.image = UIImage(named: home.imageName)
    }
}
