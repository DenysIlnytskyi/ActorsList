//
//  LoginViewController.swift
//  44444
//
//  Created by Денис Ільницький on 20/01/2023.
//

import UIKit

class LoginViewController: UIViewController {
   
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.text = UserSettings.userModel?.login
        passwordTextField.text = UserSettings.userModel?.password
}

    @IBAction func loginButtonPressed() {
        guard let loginText = loginTextField.text else { return }
        guard let passwordText = passwordTextField.text else  { return }
        
        let userObject = UserModel(name: loginText, password: passwordText)
        
        UserSettings.userLogin = loginText
        UserSettings.userLogin = passwordText
        UserSettings.userModel = userObject
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.performSegue(withIdentifier: "showActorList", sender: nil)
        }
        
    }
}
    
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        return true
    }
    
}

 
