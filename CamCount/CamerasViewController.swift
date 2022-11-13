//
//  CamerasViewController.swift
//  CamCount
//
//  Created by Paulina DeVito on 10/24/22.
//

import UIKit
//import FirebaseDatabase

class CamerasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var camerasTableView: UITableView!
    
    
    
    //MARK: - Properties
    //var ref: DatabaseReference!
    
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        camerasTableView.dataSource = self
        camerasTableView.delegate = self
        
        //creating a database reference
        //self.ref = Database.database().reference()
        
        
        //self.tableView.reloadData()
    }
    
    
    
    //MARK: - View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    
    //MARK: - Gets Data
    /*func observeData()
    {
        self.ref.child("cameras").child("cameraTest").observe(.value, with:{(snapshot) in
            
            let name = snapshot.value as? String
        })
    }*/
    
    
    
    //MARK: - TableView Stub (Row Number)
    //These stubs came with the UITableViewDataSource and UITableViewDelegate that were manually added in the "class" line at the start of the file.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
        //FIXME: Change this according to the # of cameras we are pulling from Firebase.
    }

    
    
    //MARK: - TableView Stub (Each Row)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = UITableViewCell()
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CamerasCell") as! CamerasCell
        
        //UI design for cells
        cell.layer.borderWidth = 8
        cell.layer.cornerRadius = 16
    
        
        //cell.textLabel!.text = "row: \(indexPath.row)"
        
        
        cell.cameraAssociation.text = "Testing Association"
        cell.cameraLocation.text = "Testing Location"
        
        
        return cell
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
