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
    
    // MARK: - Private values
    
    private let password = "Password"
    private let login = "Username"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let loggedInVc = segue.destination as? SuccessfulLoginViewController
        else { return }
        guard loginField.text == login && passwordField.text == password else
        { wrongEntry(); return }
        loggedInVc.username = login
    }
    
    // MARK: - Buttons
    
    @IBAction func remindUsernameButton() {
        reminder(title: "You silly goose!",
                 message: "Your login is: Username")
    }
    
    @IBAction func remindPasswordButton() {
        reminder(title: "You silly goose!",
                 message: "Your password is: Password")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is SuccessfulLoginViewController else { return }
        loginField.text = nil
        passwordField.text = nil
    }
}

// MARK: - Extensions

extension LoginPage {
    
    private func reminder(title: String, message: String) {
        let reminder = UIAlertController(title: title,
                                         message: message,
                                         preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Oh me!",
                                     style: .default)
        
        reminder.addAction(okAction)
        present(reminder, animated: true)
    }
    
    private func wrongEntry(title: String = "Oops!",
                            message: String = "Incorrect password or login!") {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Silly goose!",
                                     style: .default,
                                     handler: { _ in
                                     self.passwordField.text = nil })
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

