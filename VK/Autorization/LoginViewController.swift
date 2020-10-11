//
//  LoginViewController.swift
//  VK
//
//  Created by Владимир on 19/03/2019.
//  Copyright © 2019 Mediasoft. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak private var vkLogo: UIImageView!
    @IBOutlet weak private var loginButtonToRegister: UIButton! {
        didSet {
            loginButtonToRegister.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak private var loginInButton: UIButton! {
        didSet {
            loginInButton.layer.cornerRadius = 10
        }
    }
    
    // MARK: - Vars
    private let colorClickedCell = UIColor.init(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
    private let colorReleasedCell = UIColor.white
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setRadiusImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBarHidden()
    }
    
    // MARK: - Functions
    private func setRadiusImage() {
        vkLogo.layer.cornerRadius = 35
    }
    
    private func setNavigationBarHidden() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func alertController () {
        let alertController = UIAlertController(
            title: "Регистрация временно недоступна",
            message: "Повторите позднее",
            preferredStyle: .alert)
        
        let alertButtonOne = UIAlertAction(title: "ОК", style: .default, handler: nil)
        alertController.addAction(alertButtonOne)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - IBAction
    @IBAction private func myUnwindActionLogin(unwindSegue: UIStoryboardSegue) {}
    @IBAction private func loginButtonToRegisterClicked(_ ni: Any) {
        loginButtonToRegister.backgroundColor = colorClickedCell
    }
    @IBAction private func loginButtonToRegisterReleased(_ sender: Any) {
        loginButtonToRegister.backgroundColor = colorReleasedCell
        alertController()
    }
    @IBAction private func loginInButtonClicked(_ sender: Any) {
        loginInButton.backgroundColor = colorClickedCell
    }
    @IBAction private func loginInButtonReleased(_ sender: Any) {
        loginInButton.backgroundColor = colorReleasedCell
    }
}
