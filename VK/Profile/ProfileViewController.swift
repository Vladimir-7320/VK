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
    // MARK: - IBOutlet
    @IBOutlet var profileTableWiew: UITableView!
    
    // MARK: - Vars
    private let vkService = VKService()
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfigure()
    }
    
    // MARK: - Functions
    private func tableViewConfigure() {
        profileTableWiew.tableFooterView = UIView()
        profileTableWiew.rowHeight = 117
    }
}

    // MARK: - DataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = profileTableWiew.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileCell
        cell.configure()
        return cell
    }
}
