//
//  LoginViewController.swift
//  CamCount
//
//  Created by Paulina DeVito on 10/9/22.
//

import UIKit
import Firebase
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
        // Do any additional setup after loading the view.
    }
  
    
    //MARK: - Login Action
    @IBAction func login(_ sender: Any) {
        
        
    }
    
    
}

