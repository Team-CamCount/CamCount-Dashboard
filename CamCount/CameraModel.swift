//
//  CameraModel.swift
//  CamCount
//
//  Created by Paulina DeVito on 11/16/22.
//

import Foundation
import Firebase
import FirebaseDatabase



class Camera {
    
    var association: String
    var location: String
    var count: Int
    var battery: Int
    
    init(association:String, location:String, count:Int, battery:Int) {
        
        self.association = association;
        self.location = location;
        self.count = count;
        self.battery = battery;
    }
    
}
