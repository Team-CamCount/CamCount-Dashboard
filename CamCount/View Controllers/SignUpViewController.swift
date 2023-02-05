//
//  SignUpViewController.swift
//  CamCount
//
//  Created by Paulina DeVito on 1/4/23.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {

    
    //MARK: - Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    //MARK: - Global Variables
    var ref: DatabaseReference!
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        //styling
        Styling.styleTextField(firstNameTextField)
        firstNameTextField.layer.masksToBounds = true
        Styling.styleTextField(lastNameTextField)
        lastNameTextField.layer.masksToBounds = true
        Styling.styleTextField(emailTextField)
        emailTextField.layer.masksToBounds = true
        Styling.styleTextField(passwordTextField)
        passwordTextField.layer.masksToBounds = true
        Styling.roundButtonStyle(signUpButton)
        
        //creating the Firebase database reference
        self.ref = Database.database().reference()
    }
    
    
    //MARK: - Minimize Keyboard after Typing
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    
    
    //MARK: - Sign Up Action
    @IBAction func signUp(_ sender: Any) {
        
        //validate the text fields
        let error = validateFields()
        if (error != nil) {
            //force unwrapping here--this is fine because we have a condition that ensures the optional is not nil
            showError(error!)
        }
        else {
            //get cleaned data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            //create the user in the authentication area
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
                //this conditional is not entered if error is nil
                if error != nil {
                    self?.showError("Error creating user.")
                }
                else {
                    //gets the current user's uid (this was the user just successfully created)
                    let userID = Auth.auth().currentUser?.uid
                    
                    //casting that is necessary to get the strings passed to Firebase
                    let convertedFirstName = firstName as NSString
                    let convertedLastName = lastName as NSString
                    
                    self?.ref.child("root").child("users").child(userID!).setValue(["firstName": convertedFirstName, "lastName": convertedLastName]) { [weak self] (error, result) in

                        if error != nil {
                            self?.showError("Your user account was created, but there was an error saving your first and last names.")
                        }
                    }
                    
                    //segue to the home screen
                    self?.segueToMainScreens()
                }
            }
        }
    }
    
    
    //MARK: - Show Error
    func showError(_ error: String) {
        errorLabel.text = error
        errorLabel.alpha = 1
    }
    
    
    //MARK: - segueToMainScreens
    func segueToMainScreens()
    {
        let mainScreen = storyboard?.instantiateViewController(withIdentifier: "TBController") as? UITabBarController
        
        view.window?.rootViewController = mainScreen
        view.window?.makeKeyAndVisible()
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
                || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill in all required fields."
        }
        
        //check that the password fits the guidelines (go to FormValidation for more info)
        let cleanPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if (FormValidation.isPasswordValid(cleanPassword) == false) {
            return "Please choose a stronger password. Your password must contain a special character and a number. Your password must also be at least 8 characters long."
        }
        
        //check that the password fits the guidelines (go to FormValidation for more info)
        let cleanEmail = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if (FormValidation.isEmailValid(cleanEmail) == false) {
            return "Please choose a correct email that is associated with the FAU organization."
        }

        return nil
    }
    

}
