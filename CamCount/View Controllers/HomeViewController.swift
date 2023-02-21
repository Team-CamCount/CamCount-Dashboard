//
//  HomeViewController.swift
//  CamCount
//
//  Created by Paulina DeVito on 1/12/23.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
       //styling
        Styling.roundButtonStyle(loginButton)
        Styling.roundButtonStyle(signUpButton)
        Styling.hollowButtonStyle(signUpButton)
    }
    
    
    //MARK: - View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
}
