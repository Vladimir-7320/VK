//
//  HomeViewController.swift
//  VK
//
//  Created by Владимир on 01/04/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit
import Kingfisher
import RealmSwift

class HomeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: - Vars
    private let vkService = VKService()
    
    struct MenuItem {
        var title: String
        var imageName: String
    }
    
    var homeSection = [
        MenuItem(title: "Друзья", imageName: "friend"),
        MenuItem(title: "Группы", imageName: "group"),
        MenuItem(title: "Фоторгафии", imageName: "camera"),
        MenuItem(title: "Музыка", imageName: "music"),
        MenuItem(title: "Видео", imageName: "video"),
        MenuItem(title: "Трансляции", imageName: "target"),
        MenuItem(title: "Закладки", imageName: "night"),
        MenuItem(title: "Понравилось", imageName: "favoriteHeart"),
        MenuItem(title: "Выйти", imageName: "arrow")
    ]
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vkService.loadProfile()
        // Скрытие ненужных ячеек после таблицы
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        reloadData()
    }
    
    // MARK: - Functions
    private func reloadData() {
        self.tableView.reloadData()
    }
    
    private func alertController () {
        let alertController = UIAlertController(
            title: "Раздел временно недоступен",
            message: "Находится в разработке",
            preferredStyle: .alert)
        
        let alertButtonOne = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alertController.view.tintColor = UIColor.black
        alertController.addAction(alertButtonOne)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - IBAction
    @IBAction func myHomeUnwindAction(unwindSegue: UIStoryboardSegue) {
        self.tableView.reloadData()
    }
}

    // MARK: - DataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeSection.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
            cell.configure()
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
            let home = homeSection[indexPath.row - 1]
            cell.configure(home: home)
            return cell
        }
    }
}

    // MARK: - Delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата строка № \(indexPath.row) в секции \(indexPath.section)")
        
        if indexPath.row > 0 {
            let section = homeSection[indexPath.row - 1]
            
            switch section.title {
            case "Друзья":
                performSegue(withIdentifier: "FriendsViewController", sender: nil)
                reloadData()
            case "Группы":
                performSegue(withIdentifier: "GroupsViewController", sender: nil)
                reloadData()
            case "Фоторгафии":
                performSegue(withIdentifier: "PhotoViewController", sender: nil)
                reloadData()
            case "Музыка":
                alertController()
            case "Видео":
                alertController()
            case "Трансляции":
                alertController()
            case "Закладки":
                alertController()
            case "Понравилось":
                alertController()
            case "Выйти":
                performSegue(withIdentifier: "LoginViewController", sender: nil)
            default:
                break
            }
        }
    }
}
