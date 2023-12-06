//
//  ViewController.swift
//  login window
//
//  Created by Kirill Sinenchenko on 26.11.2023.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // Скрыть клавиатуру по тапу на экране
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    // Скрыть клавиатуру по нажатии Готво
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        print("CLICK")
    }
    
    
}

