//
//  SettingsViewController.swift
//  CamCount
//
//  Created by Paulina DeVito on 10/29/22.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SettingsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var settingsMainSubview: UIView!
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var aboutButton: UIButton!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    //MARK: - Global Variables
    var ref: DatabaseReference!
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //creating the Firebase database reference
        self.ref = Database.database().reference()
        
        //styling
        styleElements()
        Styling.semiroundButtonStyle(logoutButton)
        
        getEmailAndFullName()
    }
    
    
    //MARK: - View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    //MARK: - Get Email & Full Name
    func getEmailAndFullName() {
        
        let user = Auth.auth().currentUser
        if let user = user {
            //get email of the user
            let email = user.email
            emailLabel.text = email
            
            //get the full name of the user
            let userID = user.uid
            self.ref.child("root").child("users").child(userID).observeSingleEvent(of: .value, with: { snapshot in
                //stores data from database
                let value = snapshot.value as? NSDictionary
                let firstName = value?["firstName"] as? String ?? "Unknown"
                let lastName = value?["lastName"] as? String ?? "Unknown"
                //concatenates strings
                let fullName = firstName + " " + lastName
                //updates full name label
                self.fullNameLabel.text = fullName
                
            }) { error in
                print(error.localizedDescription)
            }
        }
        
    }
    
    
    //MARK: - Style Elements
    func styleElements() {
        settingsMainSubview.layer.cornerRadius = 30
        passwordButton.layer.cornerRadius = 16
        helpButton.layer.cornerRadius = 16
        aboutButton.layer.cornerRadius = 16
    }
    
    
    //MARK: - Logout Action
    @IBAction func logoutClicked(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            showSuccesfulLogoutAlert()
        }
        catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
            showUnsuccesfulLogoutAlert()
        }
    }
    
    
    //MARK: - Succeessful Logout Alert
    private func showSuccesfulLogoutAlert() {
        let alert = UIAlertController(title: "Logout Successful", message: "You have been successfully logged out.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
            self.segueToHomeScreen()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - Succeessful Logout Alert
    private func showUnsuccesfulLogoutAlert() {
        let alert = UIAlertController(title: "Logout Unsuccessful", message: "Your logout attempt was unsuccessful. Please try again shortly. If the problem persists, please contact support.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - Segue to Main Screens (After Logout)
    func segueToHomeScreen() {
        let homeScreen = storyboard?.instantiateViewController(withIdentifier: "HomeController") as? UINavigationController
        view.window?.rootViewController = homeScreen
        view.window?.makeKeyAndVisible()
    }
    
    
    //MARK: - Help Button Clicked
    @IBAction func helpClicked(_ sender: Any) {
        
        let helpAlert = Alerts.okAlert("Get Help", "To get help, please contact Florida Atlantic Unversity (FAU) tech support.")
        self.present(helpAlert, animated: true, completion: nil)
    }
    
    
    //MARK: - About Button Clicked
    @IBAction func aboutClicked(_ sender: Any) {
        let aboutAlert = Alerts.okAlert("Learn About Us", "CamCount as a whole is not just this app—it is an entire system. CamCount's purpose is to count the flow of people in the Florida Atlantic Unversity (FAU) Library via camera devices. This app for the CamCount system was created by Paulina DeVito. Paulina is part of the CamCount team, consisting of four other members: Vincenzo Macri, Nikita Ostro, Galen Holland, & Kristian Murphy. This project was managed by Mahesh Neelakanta, and the FAU faculty supervisor for the project was Dr. Hanqi Zhuang.")
        self.present(aboutAlert, animated: true, completion: nil)
    }
    
}
