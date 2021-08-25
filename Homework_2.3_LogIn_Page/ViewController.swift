//
//  ViewController.swift
//  Homework_2.3_LogIn_Page
//
//  Created by Arcani on 25.08.2021.
//

import UIKit

class LoginPage: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet var loginField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var forgotUsernameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    // MARK: - Private arguments
    
    private let password = "Password"
    private let login = "Login"
        
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Buttons
    
    @IBAction private func pressLoginButton() {
        guard let login = loginField.text, !login.isEmpty else {
            wrongEntry(action: UIAlertAction(title: "Ok", style: .default))
            return
        }
        
        guard let password = passwordField.text, !password.isEmpty else {
            wrongEntry(action: UIAlertAction(title: "Ok", style: .default, handler: { _ in
                self.passwordField.text = ""
            }))
            return
        }
        
        if self.login == login, self.password == password {
            print("trigger")
            performSegue(withIdentifier: "LoginSegue", sender: nil)
        } 
        wrongEntry(action: UIAlertAction(title: "Ok", style: .default))
        wrongEntry(action: UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.passwordField.text = ""
        }))
    }
    
    @IBAction func remindUsernameButton() {
        reminder(title: "You silly goose!", message: "Your login is: Login")
    }
    
    @IBAction func remindPasswordButton() {
        reminder(title: "You silly goose!", message: "Your password is: Password")
    }
}

// MARK: - Private Methods

extension LoginPage {
    private func reminder(title: String, message: String) {
        let reminder = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Oh me!", style: .default)
        reminder.addAction(okAction)
        present(reminder, animated: true)
    }
    
    private func wrongEntry(title: String = "Oops!", message: String = "The login or password is incorrect!", action: UIAlertAction) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = action
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
