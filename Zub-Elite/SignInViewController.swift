//
//  SignInViewController.swift
//  Zub-Elite
//
//  Created by Philipp Timofeev on 20.04.21.
//

import UIKit

class SignInViewController: UIViewController {
    
    // MARK: - IB Outlets - @IBOutlet

    @IBOutlet var vornameTextField: UITextField!
    @IBOutlet var nachnameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwortTextField: UITextField!
    @IBOutlet var passwortWiederholenTextField: UITextField!
    
    // MARK: - Public Properties - var

    // MARK: - Privat Properties - privat var

    // MARK: - Initializers - init

    // MARK: - Life Cycles Methods - Override func

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Navigation - Override func

    // MARK: - IB Actions - @IBAction func
    
    @IBAction func registrierenButtonPressed() {
        guard let vornameTextField = vornameTextField.text, !vornameTextField.isEmpty else {
            showAlert(title: "Fehler", message: "Vorname eingeben")
            return
        }
        guard let nachnameTextField = nachnameTextField.text, !nachnameTextField.isEmpty else {
            showAlert(title: "Fehler", message: "Nachname eingeben")
            return
            
        }
        guard let emailTextField = emailTextField.text, !emailTextField.isEmpty else {
            showAlert(title: "Fehler", message: "Email eingeben")
            return
        }
        guard let passwortTextField = passwortTextField.text, !passwortTextField.isEmpty else {
            showAlert(title: "Fehler", message: "Passwort eingeben")
            return
        }
        guard let passwortWiederholenTextField = passwortWiederholenTextField.text, !passwortWiederholenTextField.isEmpty, passwortTextField == passwortWiederholenTextField else {
            showAlert(title: "Fehler", message: "Passwort stimmt nicht überein")
            return
        }
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

extension SignInViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case vornameTextField:
            nachnameTextField.becomeFirstResponder()
        case nachnameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwortTextField.becomeFirstResponder()
        case passwortTextField:
            passwortWiederholenTextField.becomeFirstResponder()
        case passwortWiederholenTextField:
            registrierenButtonPressed()
        default:
            break
        }
        return true
    }
}
