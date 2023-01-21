//
//  LoginViewController.swift
//  CamCount
//
//  Created by Paulina DeVito on 10/9/22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class LoginViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //styling
        Styling.styleTextField(emailTextField)
        Styling.styleTextField(passwordTextField)
        Styling.roundButtonStyle(loginButton)
    }
    
    
    //MARK: - Minimize Keyboard after Typing
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
  
    
    //MARK: - Login Action
    @IBAction func login(_ sender: Any) {
        
        let cleanEmail = self.emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanPassword = self.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        Auth.auth().signIn(withEmail: cleanEmail, password: cleanPassword) { (result, error) in
            
            if (error != nil) {
                //couldn't sign in
                //TODO:
                self.errorLabel.text = "Unable to login. Please make sure you typed in the correct email and password."
                self.errorLabel.alpha = 1
            }
            else {
                let mainScreen = self.storyboard?.instantiateViewController(withIdentifier: "TBController") as? UITabBarController
                
                self.view.window?.rootViewController = mainScreen
                self.view.window?.makeKeyAndVisible()
            }
            
        }
        
    }
    
    
}

