//
//  ProfileViewController.swift
//  CamCount
//
//  Created by Paulina DeVito on 2/10/23.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ProfileViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var updateButton: UIButton!
        
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        //styling
        Styling.styleTextField(newPasswordField)
        newPasswordField.layer.masksToBounds = true
        Styling.roundButtonStyle(updateButton)
    }
    
    
    //MARK: - Change Password
    private func changePassword() {
        let cleanNewPass = newPasswordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Auth.auth().currentUser?.updatePassword(to: cleanNewPass) { (error) in
            if let error = error {
                print(error.localizedDescription)
                let alertPasswordUpdateFailed = Alerts.okAlert("Password Update Failed", "Please exit the app, reopen the app, and try again. If you are still facing problems updating your password, please contact support.")
                self.present(alertPasswordUpdateFailed, animated: true, completion: nil)
            }
        }
    }
    
    
    //MARK: - Validate Password Fields
    private func validatePassFields() {
        //Is the form empty?
        if (newPasswordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "") {
            let alertFormNotFilled = Alerts.okAlert("Form Not Filled", "Please fill in all required fields.")
            self.present(alertFormNotFilled, animated: true, completion: nil)
        }
        else {
            let cleanNewPass = newPasswordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            //Is new password valid?
            if (FormValidation.isPasswordValid(cleanNewPass) == false) {
                let alertPasswordNotValid = Alerts.okAlert("Password Not Valid", "Please choose a stronger password. Your password must be 8 characters long, contain at least 1 letter of the alphabet, & contain at least 1 special character.")
                self.present(alertPasswordNotValid, animated: true, completion: nil)
            }
            else if (FormValidation.isPasswordValid(cleanNewPass) == true) {
                //If last two tests worked, a password update is okay.
                self.changePassword()
            }
        }
    }
    
    
    //MARK: - When Update Clicked
    @IBAction func updateClicked(_ sender: Any) {
        
        // create the alert
        let alert = UIAlertController(title: "Updating Password Notice", message: "Once you update your password, this will be your new password to sign in going forward. Would you still like to update your password to the password you provided?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.destructive, handler: {_ in
            self.validatePassFields()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
