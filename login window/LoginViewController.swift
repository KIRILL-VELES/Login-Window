//
//  ViewController.swift
//  login window
//
//  Created by Kirill Sinenchenko on 26.11.2023.
//

import UIKit

final class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        
        welcomeVC.nameTextField = nameTextField.text
    }
    
    // Скрыть клавиатуру по тапу на экране
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    // Скрыть клавиатуру по нажатии Готово
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty, name.rangeOfCharacter(from: .letters) != nil else {
            showAlert(with: "Wrong!", message: "Please enter only letters in the name field")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(with: "Wrong!", message: "Please enter your password")
            return
        }
        
    }
    
    private func showAlert(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isBeingDismissed || isMovingFromParent {
            showExitConfirmation()
        }
    }
    
    private func showExitConfirmation() {
        let alertController = UIAlertController(title: "Confirm Exit", message: "Do you want to log out and exit?", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .destructive) { (_) in
            self.navigationController?.popViewController(animated: true)
            self.logout()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    private func logout() {
        nameTextField.text = nil
        passwordTextField.text = nil
    }
}
