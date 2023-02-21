//
//  Alerts.swift
//  CamCount
//
//  Created by Paulina DeVito on 2/17/23.
//

import Foundation
import UIKit


class Alerts {
    
    //MARK: - Ok Alert (Basic Alert)
    //Since this type of alert is widely used in the app, I made a static function for it.
    static func okAlert(_ title : String, _ message : String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
            print("Alert OK button tapped.")
        }))
        return alert
        //DON'T FORGET:
        //Add "present(alert, animated: true, completion: nil)" after this function call to use the alert!
    }

}
