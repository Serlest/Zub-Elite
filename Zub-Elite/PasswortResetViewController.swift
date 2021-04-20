//
//  PasswortResetViewController.swift
//  Zub-Elite
//
//  Created by Philipp Timofeev on 20.04.21.
//

import UIKit

class PasswortResetViewController: UIViewController {
    
    // MARK: - IB Outlets - @IBOutlet

    @IBOutlet var emailTextField: UITextField!
    
    // MARK: - Public Properties - var

    // MARK: - Privat Properties - privat var

    // MARK: - Initializers - init

    // MARK: - Life Cycles Methods - Override func

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Navigation - Override func

    // MARK: - IB Actions - @IBAction func

    @IBAction func passwortWiederherstellenButtonPressed() {
        guard let emailTextField = emailTextField.text, !emailTextField.isEmpty else {
            showAlert(title: "Fehler", message: "Email eingeben")
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

extension PasswortResetViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwortWiederherstellenButtonPressed()
        return true
    }
}

