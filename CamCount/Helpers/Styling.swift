//
//  Styling.swift
//  CamCount
//
//  Created by Paulina DeVito on 1/11/23.
//

import Foundation
import UIKit


class Styling {
    
    //MARK: - Text Fields
    static func styleTextField(_ textField : UITextField) {
        //creates the bottom line
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width: textField.frame.width, height: 2)
        bottomLine.backgroundColor = UIColor.white.cgColor
        //removes the border on the text field, which is a default
        textField.borderStyle = .none
        //adds the bottom line
        textField.layer.addSublayer(bottomLine)
    }
    
    //MARK: - Buttons
    static func filledButtonStyle(_ button: UIButton) {
        button.backgroundColor = UIColor.init(red: 255/255, green: 163/255, blue: 79/255, alpha: 1)
        button.layer.cornerRadius = 24
        button.tintColor = UIColor.white
    }
    static func hollowButtonStyle(_ button: UIButton) {
        button.layer.borderWidth = 2
        button.layer.backgroundColor = UIColor.clear.cgColor
        button.layer.borderColor = UIColor.init(red: 255/255, green: 163/255, blue: 79/255, alpha: 1).cgColor
        button.layer.cornerRadius = 24
        button.tintColor = UIColor.white
    }
    static func roundButtonStyle(_ button: UIButton) {
        button.layer.cornerRadius = 24
    }
    static func semiroundButtonStyle(_ button: UIButton) {
        button.layer.cornerRadius = 12
    }
    
}
