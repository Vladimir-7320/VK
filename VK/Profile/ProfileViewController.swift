//
//  ProfileViewController.swift
//  VK
//
//  Created by Владимир on 04/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit
import Kingfisher

class ProfileViewController: UIViewController {
    
    private let vkService = VKService()
    @IBOutlet var profileTableWiew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Скрытие ненужных ячеек после таблицы
        profileTableWiew.tableFooterView = UIView()
        // Установка высоты ячейки
        profileTableWiew.rowHeight = 117
        
    }
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTableWiew.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileCell
        let profile = Singltone.instance.profileGU
        
        //if indexPath.row == 0 {
            cell.profileAvatarImageView.kf.setImage(with: URL(string: profile.photo_100))
            // Делаем изображение круглым
            cell.profileAvatarImageView.layer.cornerRadius = cell.profileAvatarImageView.frame.height/2
            cell.profileNameTextLabel.text = profile.first_name + " " + profile.last_name
            if profile.online == 0 {
                cell.profileOnlineTextLabel.text = "Offline"
            } else {
                cell.profileOnlineTextLabel.text = "Online"
            }
            cell.profileBearTextLabel.text = "Дата рождения " + profile.bdate
            cell.profileCityTextLabel.text = profile.countryTitle + ", " + profile.cityTitle
            if profile.sex == 1 {
                cell.profileSexTextLabel.text = "Пол: Женщина"
            } else if profile.sex == 2 {
                cell.profileSexTextLabel.text = "Пол: Мужчина"
            } else {
                
            }
        //}
        
        
        return cell
    }
}
