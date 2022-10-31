//
//  CamerasCell.swift
//  CamCount
//
//  Created by Paulina DeVito on 10/30/22.
//

import UIKit

class CamerasCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var cameraAssociation: UILabel!
    @IBOutlet weak var cameraLocation: UILabel!
    @IBOutlet weak var cameraBattery: UIProgressView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
