//
//  ViewController.swift
//  Homework_2.3_LogIn_Page
//
//  Created by Arcani on 25.08.2021.
//

import UIKit

class LoginPage: UIViewController {
    
    @IBOutlet var loginField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var forgotUsernameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    private let password = "Password"
    private let login = "Username"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let loggedInVc = segue.destination as? SuccessfulLoginViewController else { return }
        guard loginField.text == login && passwordField.text == password else {
            wrongEntry()
            return
        }
        guard let login = loginField.text else { return }
        loggedInVc.username = login
    }
    
    @IBAction func remindUsernameButton() {
        reminder(title: "You silly goose!", message: "Your login is: Username")
    }
    
    @IBAction func remindPasswordButton() {
        reminder(title: "You silly goose!", message: "Your password is: Password")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is SuccessfulLoginViewController else { return }
        loginField.text = nil
        passwordField.text = nil
    }
    
}

// MARK: - Private Methods

extension LoginPage {
    
    private func reminder(title: String, message: String){
        let reminder = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Oh me!", style: .default)
        reminder.addAction(okAction)
        present(reminder, animated: true)
    }
    
    private func wrongEntry(title: String = "Oops!", message: String = "The login or password is incorrect!") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.passwordField.text = nil
        })
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

