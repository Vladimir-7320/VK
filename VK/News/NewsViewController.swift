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
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Vars
    private let vkService = VKService()
    private var vkNews: NewsObject?
    
    // MARK: - Life Cycles
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
    
    // MARK: - Functions
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
        uCell.configure(with: newsItems, newsItems: newsItems, uVkNews: uVkNews)
        return uCell
    }
    
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 523
    }
}
