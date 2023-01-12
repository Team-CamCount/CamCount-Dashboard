//
//  CamerasCell.swift
//  CamCount
//
//  Created by Paulina DeVito on 10/30/22.
//

import UIKit
import Firebase
import FirebaseDatabase


class CamerasCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var cameraAssociation: UILabel!
    @IBOutlet weak var cameraLocation: UILabel!
    @IBOutlet weak var cameraBattery: UIProgressView!
    @IBOutlet weak var cameraCount: UILabel!
    
    
    //MARK: - Cell Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    
    //MARK: - Set Selected 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    //MARK: - Layout Subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
}
