//
//  WelcomeViewController.swift
//  login window
//
//  Created by Kirill Sinenchenko on 06.12.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var greetinglabel: UILabel!
    
    var nameTextField: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetinglabel.text = "Hello, \(nameTextField ?? "") !"
    }
    
    @IBAction func logOutButtonAction(_ sender: UIButton) {
        showAlert(with: "Log Out", message: "Are you sure you want to log out?", style: .alert, actions: [
            UIAlertAction(title: "Log Out", style: .destructive, handler: { (_) in
                self.logOut()
            }),
            UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ])
    }
    
    func logOut() {
        if let loginViewController = presentingViewController as? LoginViewController {
            loginViewController.nameTextField.text = nil
            loginViewController.passwordTextField.text = nil
        }
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(with title: String, message: String, style: UIAlertController.Style, actions: [UIAlertAction]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        for action in actions {
            alertController.addAction(action)
        }
        present(alertController, animated: true, completion: nil)
    }
}
