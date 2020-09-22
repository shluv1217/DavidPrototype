//
//  RegisterViewController.swift
//  DavidPrototype
//
//  Created by David Shin on 2020/09/22.
//  Copyright © 2020 David Shin. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController{
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                //Error handling
                if let e = error {

                    let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                    let action = UIAlertAction(title: "ok", style: .default) { (action) in
                    }
                    
                    alert.addAction(action)
                    
                    self.present(alert, animated: true, completion: nil)
                    
                }else{
                    //Navigate to category viewController
                    self.performSegue(withIdentifier: "RegisterToCategory", sender: self)
                }
            }
        }
    }
}
