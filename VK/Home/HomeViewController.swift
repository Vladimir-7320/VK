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
    
    @IBAction func myHomeUnwindAction(unwindSegue: UIStoryboardSegue) {
        self.tableView.reloadData()
    }
    @IBOutlet weak var tableView: UITableView!
    
    private let vkService = VKService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vkService.loadProfile()
        // Скрытие ненужных ячеек после таблицы
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reloadData()
    }
    
    private func reloadData() {
        self.tableView.reloadData()
    }
    
    
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
}


// Протокол который является источником данных для таблицы
extension HomeViewController: UITableViewDataSource {
    // Метод, в котором мы обязаны вернуть количество секций в таблице (Int)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Метод возвращает количество строк в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeSection.count + 1
    }
    
    // метод в котором предоставляем информацию о том, какая именно ячейка будет находиться в конкретной строке
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Получаем ячейку из пула
       
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileTableViewCell
            
            let profile = Singltone.instance.profileGU
            
            cell.nameTextLabel.text = profile.first_name + " " + profile.last_name
            
            // Кастомизации аватарки
            // Установка изображения
            cell.avatarPhotoImage.kf.setImage(with: URL(string: profile.photo_50))
            // Делаем изображение круглым
            cell.avatarPhotoImage.layer.cornerRadius = cell.avatarPhotoImage.frame.height/2
            
            // Кастомизация ячейки
            // Смена цвета при нажатии на ячейку
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.init(red: 55/255, green: 55/255, blue: 57/255, alpha: 1)
            cell.selectedBackgroundView = bgColorView
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
            
            // Получаем город для конкретной строки
            let home = homeSection[indexPath.row - 1]
            
            cell.textLabelCell.text = home.title
            cell.photoMenuImage.image = UIImage(named: home.imageName)
            
            // Кастомизация ячейки
            // Смена цвета при нажатии на ячейку
            let bgColorView = UIView()
            bgColorView.backgroundColor = UIColor.init(red: 50/255, green: 50/255, blue: 52/255, alpha: 1)
            cell.selectedBackgroundView = bgColorView
            
            return cell
        }
    }
}



// Протокол, отвечает за обработку нажатий на ячейку
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
                performSegue(withIdentifier: "Developers", sender: nil)
            case "Видео":
                performSegue(withIdentifier: "Developers", sender: nil)
            case "Трансляции":
                performSegue(withIdentifier: "Developers", sender: nil)
            case "Закладки":
                performSegue(withIdentifier: "Developers", sender: nil)
            case "Понравилось":
                performSegue(withIdentifier: "Developers", sender: nil)
            case "Выйти":
                //myHomeUnwindAction(unwindSegue: UIStoryboardSegue)
                //performSegue(withIdentifier: "LoginViewController", sender: nil)
                dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
    }
    
    // Создание Alert
    private func alertController () {
        // Создаем объект типа UIAlertController, описывающий модальное окно
        let alertController = UIAlertController(
            title: "Раздел временно недоступен",
            message: "Находится в разработке",
            preferredStyle: .alert)
        
        // Создаем объекты типа UIAlertAction, описывающие кнопки
        let alertButtonOne = UIAlertAction(title: "ОК", style: .default, handler: nil)
        
        // Меняем цвет текста
        alertController.view.tintColor = UIColor.black
        
        // Добавляем созданные кнопки в модальное окно
        alertController.addAction(alertButtonOne)
        
        // Выводим вспылывающее окно
        self.present(alertController, animated: true, completion: nil)
    }
}
