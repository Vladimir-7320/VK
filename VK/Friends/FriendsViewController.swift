//
//  FriendsViewController.swift
//  VK
//
//  Created by Владимир on 04/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class FriendsViewController: UIViewController {
    
    @IBOutlet var friendsTableView: UITableView!
    
    private let vkService = VKService()
    var friends: Results<FriendObject>?
    var tokenNotificationFriends: NotificationToken?
    
    // Realm notifications
    private func pairTableAndRealm() {
        guard let realm = try? Realm() else { return }
        friends = realm.objects(FriendObject.self)
        
        self.tokenNotificationFriends = friends?.observe { [weak self] (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                self?.friendsTableView.reloadData()
            case .update(_, let deletions, let insertions, let modifications):
                self?.friendsTableView.beginUpdates()
                self?.friendsTableView.insertRows(at: insertions.map ( {IndexPath(row: $0, section: 0)} ),
                                                     with: .automatic)
                self?.friendsTableView.deleteRows(at: deletions.map ( {IndexPath(row: $0, section: 0)} ),
                                                     with: .automatic)
                self?.friendsTableView.reloadRows(at: modifications.map( {IndexPath(row: $0, section: 0)} ),
                                                     with: .automatic)
                self?.friendsTableView.endUpdates()
            case .error(let error):
                print(error)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pairTableAndRealm()
        vkService.loadFriends { (friends) in
            try? RealmProvider.save(items: friends)
        }
        // Скрытие ненужных ячеек после таблицы
        friendsTableView.tableFooterView = UIView()
    }
}

extension FriendsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath) as! FriendsCell
        guard let friend = friends?[indexPath.row] else { return cell }
            
        // Кастомизация ячейки
        // Смена цвета при нажатии на ячейку
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.init(red: 55/255, green: 55/255, blue: 57/255, alpha: 1)
        cell.selectedBackgroundView = bgColorView
        // Установка изображения
        cell.friendsImageView.kf.setImage(with: URL(string: friend.photo_50))
        // Установка имени друга
        cell.friendsTextLabel.text = friend.first_name + " " + friend.last_name
        // Делаем аватарку круглым
        cell.friendsImageView.layer.cornerRadius = cell.friendsImageView.frame.height/2
            
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "friendsPhotoSegue" else { return }
        guard let destination = segue.destination as? FriendsPhotoViewController else { return }
        let indexpath = self.friendsTableView.indexPathForSelectedRow
        let friend = friends?[(indexpath?.row)!]
        destination.friendsId = friend!.id
    }
    
}
