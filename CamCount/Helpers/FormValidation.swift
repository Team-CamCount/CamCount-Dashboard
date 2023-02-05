//
//  FormValidation.swift
//  CamCount
//
//  Created by Paulina DeVito on 1/12/23.
//

import Foundation
import UIKit


class FormValidation {
  
    
    //MARK: - Email Validation
    //SOURCE USED: https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
    //SOURCE USED: https://stackoverflow.com/questions/5191560/how-to-match-all-email-addresses-at-a-specific-domain-using-regex
    static func isEmailValid(_ email : String) -> Bool {
        let emailTest = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@fau\\.edu$")
        return emailTest.evaluate(with: email)
    }

    
    //MARK: - Password Validation
    //SOURCE USED: https://iosdevcenters.blogspot.com/2017/06/password-validation-in-swift-30.html
    static func isPasswordValid(_ password : String) -> Bool {
        //regex that makes sure the passwords have the following...
            //one character
            //one special character
            //length of 8
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
  
    
}
