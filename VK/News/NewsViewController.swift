//
//  NewsViewController.swift
//  VK
//
//  Created by Владимир on 04/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftUI

class NewsViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var newsTableView: UITableView!
    
    // MARK: - Vars
    private let vkService = VKService()
    private var vkNews: NewsObject?
    var presenceTextNews = false
    var presenceImageNews = false
    
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
                self?.newsTableView.reloadData()
            }
        )
    }
    
    // MARK: - Functions
    private func configureTableView() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
        
    }
}

// MARK: - DataSource
extension NewsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        vkNews?.items.count ?? 0
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "topNewsCellID", for: indexPath) as! TopNewsCell
            
            let newsItems = vkNews?.items[indexPath.section]
            cell.configure(newsItems: newsItems!, uVkNews: vkNews!)

            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "textNewsCellID", for: indexPath) as! TextNewsCell
                
            let newsItems = vkNews?.items[indexPath.section]
            cell.configure(with: newsItems!)
            
            let newsItemsTextCheck = vkNews?.items[indexPath.section]
            if newsItemsTextCheck?.text.contains("о") != true {
                presenceTextNews = true
            }
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageNewsCellID", for: indexPath) as! ImageNewsCell
            
            let newsItems = vkNews?.items[indexPath.section]
            cell.configure(newsItems: newsItems!)
            
            let newsItemsImageCheck = vkNews?.items[indexPath.section]
            if newsItemsImageCheck?.photoUrl.contains("https") != true {
                presenceImageNews = true
            }
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "bottomNewsCellID", for: indexPath) as! BottomNewsCell
            
            let newsItems = vkNews?.items[indexPath.section]
            cell.configure(with: newsItems!)
            presenceTextNews = false
            presenceImageNews = false
            
            return cell
        }
    }
}

// MARK: - Delegate
extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 && presenceTextNews == true {
            return 0
        } else if indexPath.row == 2 && presenceImageNews == true {
            return 0
        } else {
            return UITableView.automaticDimension
        }
        
    }
}

