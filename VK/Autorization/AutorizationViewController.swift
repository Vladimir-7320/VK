//
//  AutorizationViewController.swift
//  VK
//
//  Created by Владимир on 25/03/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

//import UIKit
//
//class AutorizationViewController: UIViewController {
//
//    @IBOutlet weak var logoVK: UIImageView!
//    @IBOutlet weak var loginTextField: UITextField!
//    @IBOutlet weak var passwordTextField: UITextField!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Изменение радиуса у лого logoVK
//        logoVK.layer.cornerRadius = 25
//
//        // Кастомизация loginTextField
//        configuerloginTextField ()
//
//        // Кастомизация passwordTextField
//        configuerPasswordTextField()
//
//        // Добавление жеста
//        // Скрытие клавиатуры по тапу
//        pressingGesture ()
//
//    }
//
//    // Кастомизация loginTextField
//    private func configuerloginTextField () {
//        loginTextField.layer.cornerRadius = 10
//        loginTextField.layer.borderWidth = 1
//        loginTextField.layer.borderColor = UIColor(red: 255/255,
//                                                   green: 255/255,
//                                                   blue: 255/255,
//                                                   alpha: 0.5).cgColor
//        // Изменение текста и цвета внутри поля Placeholder
//        loginTextField.attributedPlaceholder = NSAttributedString(string: "Email или телефон",
//                                                                  attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)])
//    }
//
//    // Кастомизация passwordTextField
//    private func configuerPasswordTextField() {
//        passwordTextField.layer.cornerRadius = 10
//        passwordTextField.layer.borderWidth = 1
//        passwordTextField.layer.borderColor = UIColor(red: 255/255,
//                                                      green: 255/255,
//                                                      blue: 255/255,
//                                                      alpha: 0.5).cgColor
//        // Изменение текста и цвета внутри поля Placeholder
//        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Пароль",
//                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)])
//    }
//
//    // Кастомизации кнопки Войти
//    @IBOutlet weak var autorizationLoginButton: UIButton! {
//        didSet {
//            // Добавление радиуса
//            autorizationLoginButton.layer.cornerRadius = 10
//        }
//    }
//
//    @IBAction func autorizationLoginButtonClicked(_ sender: Any) {
//        // Изменение цвета фона при нажатии
//        autorizationLoginButton.backgroundColor = UIColor.init(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
//    }
//
//    @IBAction func autorizationLoginButtonReleased(_ sender: Any) {
//        // Изменение цвета фона при отпускании
//        autorizationLoginButton.backgroundColor = UIColor.white
//    }
//
//    @IBAction func autorizationLoginButtonPressed(_ sender: Any) {}
//
//    // Проверка авторизации
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        // Проверяем данные
//        let checkResult = checkUserData()
//
//        // Если данные неверны, покажем ошибку
//        if !checkResult {
//            showLoginError()
//        }
//
//        // Вернем результат
//        return checkResult
//    }
//
//    // Проверка введенных данных
//    func checkUserData() -> Bool {
//        // Получаем текст логина
//        let login = loginTextField.text!
//        // Получаем текст-пароль
//        let password = passwordTextField.text!
//
//        // Проверяем, верны ли они
//        if login == "" && password == "" {
//            print("Успешная авторизация")
//            return true
//        } else {
//            print("Неуспешная авторизация")
//            return false
//        }
//    }
//
//    // Если данные неверны, покажем Alert ошибку
//    func showLoginError() {
//        // Создаем контроллер
//        let alter = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: .alert)
//        // Создаем кнопку для UIAlertController
//        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//        // Добавляем кнопку на UIAlertController
//        alter.addAction(action)
//        // Показываем UIAlertController
//        present(alter, animated: true, completion: nil)
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        // Скрытие панели навигации
//        navigationController?.setNavigationBarHidden(true, animated: false)
//    }
//
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        // Изменение цвета статус бара на белый
//        return .lightContent
//    }
//
//    // Реализация метода скрытия клавиатуры
//    @objc func hideKeyboard() {
//        self.view?.endEditing(true)
//    }
//
//    func pressingGesture() {
//        // Жест нажатия
//        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        // Присваиваем его AutorizationViewController.view
//        view?.addGestureRecognizer(hideKeyboardGesture)
//    }
//}
