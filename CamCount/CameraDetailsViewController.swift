//
//  CameraDetailsViewController.swift
//  CamCount
//
//  Created by Paulina DeVito on 11/11/22.
//

import UIKit
import Firebase
import FirebaseDatabase


class CameraDetailsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var individualCount: UILabel!
    
    
    //MARK: - Global Variables
    var ref: DatabaseReference! //FIXME: Might not need this.
    var passedCamera = Camera(association: "default", location: "default", count: 0, battery: 0)
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.isNavigationBarHidden = true
        
        //print(passedCamera.association)
        //print(passedCamera.location)
        //print(passedCamera.count)
        //print(passedCamera.battery)
        
        if (passedCamera.count >= 0) {
            individualCount?.text = String(passedCamera.count)
        } else {
            individualCount?.text = String(0)
        }
    }

}
