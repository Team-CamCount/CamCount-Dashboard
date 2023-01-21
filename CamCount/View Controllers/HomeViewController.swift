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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
