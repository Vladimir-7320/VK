//
//  NewsViewController.swift
//  VK
//
//  Created by Владимир on 04/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit
import Kingfisher

class NewsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let vkService = VKService()
    var vkNews: NewsObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        vkService.loadNews (
            completion: { [weak self] news, error in
                guard error == nil else {
                    print("Some error in loading data")
                    return
                }
                
                self?.vkNews = news
                self?.tableView.reloadData()
            }
        )
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            UINib(nibName: "NewsCell", bundle: nil),
            forCellReuseIdentifier: "newsCellID"
        )
    }
    
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vkNews?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCellID", for: indexPath) as? NewsCell
        
        guard let uCell = cell, let uVkNews = vkNews else {
            return UITableViewCell()
        }
       
        let newsItems = uVkNews.items[indexPath.row]
        let sourceID = newsItems.source_id
        let newsGroups = uVkNews.groups.filter { $0.id == -sourceID }.first
        let newsProfiles = uVkNews.profiles.filter { $0.id == sourceID }.first
        
        if newsGroups == nil {
            uCell.userNameLable.text = newsProfiles!.last_name + " " + newsProfiles!.first_name
            uCell.userPhotoImageView.kf.setImage(with: URL(string: newsProfiles!.photo_50))
        } else {
            uCell.userNameLable.text = newsGroups!.name
            uCell.userPhotoImageView.kf.setImage(with: URL(string: newsGroups!.photo_50))
        }
        
        uCell.newsPhotoImageView.kf.setImage(with: URL(string: newsItems.photoUrlFirst))
        
        uCell.configure(with: newsItems)
        
        return uCell
    }
    
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 523
    }
}
