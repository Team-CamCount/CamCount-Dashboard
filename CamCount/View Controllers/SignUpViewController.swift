//
//  SignUpViewController.swift
//  CamCount
//
//  Created by Paulina DeVito on 1/4/23.
//

import UIKit
import Firebase
import FirebaseCore

class SignUpViewController: UIViewController {

    
    //MARK: - Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var zNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    //MARK: - Global Variables
    
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        //stylingElements()
        
        
    }
    
    
    //MARK: - Styling
    /*
    func stylingElements() {
        errorLabel.alpha = 0
        Styling.signUpButton1Style(firstNameTextField)
    }
    */
    
    
    
    
    //MARK: - Sign Up Action
    @IBAction func signUp(_ sender: Any) {
        
        //validate the text fields
        let error = validateFields()
        if (error != nil) {
            //force unwrapping here--this is fine because we have a condition that ensures the optional is not nil
            showError(error!)
        }
        
        //create the user
        
        
        
        
        //transition to the home screen
        

        
    }
    
    
    //MARK: - Show Error
    func showError(_ error: String) {
        errorLabel.text = error
        errorLabel.alpha = 1
    }
    
    
    //MARK: - Validate Fields
    //Checks the fields to validate if the data entered is acceptable.
    //if data entered is acceptable -> returns nil
    //if data entered is unacceptable -> returns error
    func validateFields() -> String? {
        
        //check that all text fields are filled in
        //we trim off the white spaces and new lines before we check
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
                || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
                || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
                || zNumberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
                || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all required fields."
        }
        
        //check that the password fits the guidelines (go to FormValidation for more info)
        let cleanPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if (FormValidation.isPasswordValid(cleanPassword) == false) {
            return "Please choose a stronger password. Your password must contain a special character and a number. Your password must also be at least 8 characters long."
        }

        return nil
    }
    
    
   
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
