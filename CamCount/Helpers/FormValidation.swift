//
//  FormValidation.swift
//  CamCount
//
//  Created by Paulina DeVito on 1/12/23.
//

import Foundation
import UIKit


class FormValidation {
  
    
    //MARK: - Password Validation
    //CODE SOURCE: https://iosdevcenters.blogspot.com/2017/06/password-validation-in-swift-30.html
    static func isPasswordValid(_ password : String) -> Bool {
        //regex that makes sure the passwords have the following...
            //one character
            //one special character
            //length of 8
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
  
    
}
