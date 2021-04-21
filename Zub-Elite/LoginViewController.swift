//
//  LoginViewController.swift
//  Zub-Elite
//
//  Created by Philipp Timofeev on 20.04.21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets - @IBOutlet
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwortTextField: UITextField!
    
    // MARK: - Public Properties - var
    
    // MARK: - Privat Properties - privat var
    
    // MARK: - Initializers - init
    
    // MARK: - Life Cycles Methods - Override func
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    // MARK: - Navigation - Override func
    
    // MARK: - IB Actions - @IBAction func
    
    @IBAction func einlogenButtonPressed() {
       
        guard let emailTextField = emailTextField.text, !emailTextField.isEmpty else {
            showAlert(title: "Fehler", message: "Email-Adresse eingeben")
            return
        }
        guard let passwortTextField = passwortTextField.text, !passwortTextField.isEmpty else {
            showAlert(title: "Fehler", message: "Passwort eingeben")
            return
        }
        Auth.auth().signIn(withEmail: emailTextField, password: passwortTextField) { [weak self] authResult, error in
            if  error != nil {
                self?.showAlert(title: "Etwas falsch", message: "\(String(describing: error?.localizedDescription))")
                return
            } else {
                self?.performSegue(withIdentifier: "logIn", sender: nil)
            }

        }

    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
  
        emailTextField.text = nil
        passwortTextField.text = nil
    }
    
    // MARK: - Public Methods - func
    
    // MARK: - Privat Methods - privat func
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Alles klar", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(doneAction)
        present(alert, animated: true)
    }
  
}

// MARK: - Extension - extension

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwortTextField.becomeFirstResponder()
        } else {
            einlogenButtonPressed()
        }
        return true
    }
}
