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
    
    // MARK: - IBOutlet
    @IBOutlet weak var searchGroups: UISearchBar!
    @IBOutlet var groupsTableView: UITableView!
    
    // MARK: - Vars
    private let vkService = VKService()
    private var groups: Results<GroupObject>?
    private var tokenNotificationsGroups: NotificationToken?
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        pairTableAndRealm()
        vkService.loadGroup { (groups) in
            try? RealmProvider.save(items: groups)
        }
        tableViewConfigure()
    }
    
    // MARK: - Functions
    private func tableViewConfigure() {
        groupsTableView.tableFooterView = UIView()
        groupsTableView.rowHeight = 60
    }
    
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
}

extension GroupsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupsCell", for: indexPath) as! GroupsCell
        guard let group = groups?[indexPath.row] else { return cell }
        cell.configure(group: group)
        return cell
    }
}
