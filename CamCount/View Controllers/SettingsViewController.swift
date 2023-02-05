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
    @IBOutlet weak var settingsSubview1: UIView!
    @IBOutlet weak var settingsSubview2: UIView!
    @IBOutlet weak var settingsSubview3: UIView!
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        //styling
        styleElements()
        Styling.semiroundButtonStyle(logoutButton)
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
    
    
    
    //MARK: - Style Elements
    func styleElements() {
        settingsMainSubview.layer.cornerRadius = 30
        settingsSubview1.layer.cornerRadius = 16
        settingsSubview2.layer.cornerRadius = 16
        settingsSubview3.layer.cornerRadius = 16
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
    
    
    
    //MARK: - segueToMainScreens
    func segueToHomeScreen()
    {
        let homeScreen = storyboard?.instantiateViewController(withIdentifier: "HomeController") as? UINavigationController
        
        view.window?.rootViewController = homeScreen
        view.window?.makeKeyAndVisible()
    }
    
    
}
