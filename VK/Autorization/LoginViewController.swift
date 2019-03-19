//
//  LoginViewController.swift
//  VK
//
//  Created by Владимир on 19/03/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func myUnwindActionLogin(unwindSegue: UIStoryboardSegue) {}
    @IBOutlet weak var vkLogo: UIImageView!
    
    // Кастомизация кнопки "Зарегистрироваться":
    @IBOutlet weak var loginButtonToRegister: UIButton! {
        didSet {
            // Добавление радиуса
            loginButtonToRegister.layer.cornerRadius = 10
        }
    }
    
    @IBAction func loginButtonToRegisterClicked(_ ni: Any) {
        // Изменение цвета фона при нажатии
        loginButtonToRegister.backgroundColor = UIColor.init(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
    }
    
    @IBAction func loginButtonToRegisterReleased(_ sender: Any) {
        // Изменение цвета фона при отпускании
        loginButtonToRegister.backgroundColor = UIColor.white
        
        // Добавление Alert
        alertController()
        
    }
    
    // Создание Alert
    private func alertController () {
        // Создаем объект типа UIAlertController, описывающий модальное окно
        let alertController = UIAlertController(
            title: "Регистрация временно недоступна",
            message: "Повторите позднее",
            preferredStyle: .alert)
        
        // Создаем объекты типа UIAlertAction, описывающие кнопки
        let alertButtonOne = UIAlertAction(title: "ОК", style: .default, handler: nil)
        
        // Добавляем созданные кнопки в модальное окно
        alertController.addAction(alertButtonOne)
        
        // Выводим вспылывающее окно
        self.present(alertController, animated: true, completion: nil)
    }
    
    // Кастомизация кнопки Войти:
    @IBOutlet weak var loginInButton: UIButton! {
        didSet {
            // Добавление радиуса
            loginInButton.layer.cornerRadius = 10
        }
    }
    
    @IBAction func loginInButtonClicked(_ sender: Any) {
        // Изменение цвета фона при нажатии
        loginInButton.backgroundColor = UIColor.init(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
    }
    
    @IBAction func loginInButtonReleased(_ sender: Any) {
        // Изменение цвета фона при отпускании
        loginInButton.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Кастомизация logo
        vkLogo.layer.cornerRadius = 35
        
//        let networkingService = AlamofireService()
//        networkingService.sendRequest()
        
        
           
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Скрытие панели навигации
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        // Изменение цвета статус бара на белый
        return .lightContent
    }
}
