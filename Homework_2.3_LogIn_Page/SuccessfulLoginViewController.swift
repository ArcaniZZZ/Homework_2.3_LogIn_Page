//
//  SuccessfulLoginViewController.swift
//  Homework_2.3_LogIn_Page
//
//  Created by Arcani on 25.08.2021.
//

import UIKit

class SuccessfulLoginViewController: UIViewController {
    
    @IBOutlet var greetingMessage: UILabel!
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let username = username else { return }
        greetingMessage.text = "Hello, \(username)!"
    }
    
    @IBAction func signOffButtonPressed() {
        dismiss(animated: true)
    }
    
}
