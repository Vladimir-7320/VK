//
//  GroupsViewController.swift
//  VK
//
//  Created by Владимир on 19/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class GroupsViewController: UIViewController {
    
    @IBOutlet weak var searchGroups: UISearchBar!
    @IBOutlet var groupsTableView: UITableView!
    
    //private var arrayvk = [GroupObject]()
    private let vkService = VKService()
    private var groups: Results<GroupObject>?
    var tokenNotificationsGroups: NotificationToken?
    
    // Realm notifications
    private func pairTableAndRealm() {
        guard let realm = try? Realm() else { return }
        groups = realm.objects(GroupObject.self)
        
        self.tokenNotificationsGroups = groups?.observe { [weak self] (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                self?.groupsTableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                self?.groupsTableView.beginUpdates()
                self?.groupsTableView.insertRows(at: insertions.map ( {IndexPath(row: $0, section: 0)} ),
                                                     with: .automatic)
                self?.groupsTableView.deleteRows(at: deletions.map ( {IndexPath(row: $0, section: 0)} ),
                                                     with: .automatic)
                self?.groupsTableView.reloadRows(at: modifications.map( {IndexPath(row: $0, section: 0)} ),
                                                     with: .automatic)
                self?.groupsTableView.endUpdates()
            case .error(let error):
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pairTableAndRealm()
        vkService.loadGroup { (groups) in
            try? RealmProvider.save(items: groups)
        }
        // Скрытие ненужных ячеек после таблицы
        groupsTableView.tableFooterView = UIView()
        // Установка высоты ячейки
        groupsTableView.rowHeight = 60
    }
}

extension GroupsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupsCell", for: indexPath) as! GroupsCell
        guard let group = groups?[indexPath.row] else { return cell }
        
        
        // Кастомизация ячейки
        // Смена цвета при нажатии на ячейку
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.init(red: 50/255, green: 50/255, blue: 52/255, alpha: 1)
        cell.selectedBackgroundView = bgColorView
        
        // Установка изображения
        cell.groupsImageView.kf.setImage(with: URL(string: group.photo_50))
        // Делаем изображение круглым
        cell.groupsImageView.layer.cornerRadius = cell.groupsImageView.frame.height/2
        
        // Установка названия групп
        cell.groupsTextLabel.text = group.name
        
        // Установка значение группы открытая/закрытая
        if group.is_closed == 0 {
            cell.groupsValueTextLabel.text = "Открытая группа"
        } else {
            cell.groupsValueTextLabel.text = "Закрытая группа"
        }
        
        return cell
    }
}

extension GroupsViewController: UISearchBarDelegate {
    
    
}
