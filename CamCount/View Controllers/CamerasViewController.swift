//
//  CamerasViewController.swift
//  CamCount
//
//  Created by Paulina DeVito on 10/24/22.
//

import UIKit
import Firebase
import FirebaseDatabase


class CamerasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var camerasTableView: UITableView!
    @IBOutlet weak var camerasSubview: UIView!
    
    
    //MARK: - Global Variables
    var ref: DatabaseReference!
    var allCameras = [Camera]()
    let cellSpacingHeight: CGFloat = 0.2
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        camerasTableView.dataSource = self
        camerasTableView.delegate = self
        
        //styling
        styleElements()
        
        //creating the Firebase database reference
        self.ref = Database.database().reference()
    }
    
    
    //MARK: - View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
        loadCameras()
    }
    
    
    //MARK: - Get Camera Data
    @objc func loadCameras()
    {
        self.ref.child("root/cameras").observe(DataEventType.value, with: { [weak self] (snapshot) in
            
            //code to execute when any value under this is changed
            if (snapshot.childrenCount > 0) {
                self?.allCameras.removeAll()
                
                for camera in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let object = camera.value as? [String: AnyObject]
                    let association = object?["association"]
                    let location = object?["location"]
                    let count = object?["count"]
                    let battery = object?["battery"]
                    
                    
                    let camera = Camera(association: association as! String, location: location as! String, count: count as! Int, battery: battery as! Int)
                    
                    self?.allCameras.append(camera)
            
                    
                    self?.camerasTableView.reloadData()
                    
                    //self.refreshControl.endRefreshing() //ends the pull to refresh
                }
            }
        })
    }
    
    
    //MARK: - Style Elements
    func styleElements() {
        camerasTableView.layer.cornerRadius = 16
        camerasSubview.layer.cornerRadius = 30
    }

    
    //MARK: - TableView Stub (Row Number)
    //These stubs came with the UITableViewDataSource and UITableViewDelegate that were manually added in the "class" line at the start of the file.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        //the amount of cameras we are getting back from Firebase
        return allCameras.count
    }
    
    
    //MARK: - TableView Stub (Each Row)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CamerasCell") as! CamerasCell
        
        
        let camera: Camera = allCameras[indexPath.row]
        
        cell.cameraAssociation?.text = camera.association
        cell.cameraLocation?.text = camera.location
        
        if (camera.count >= 0) {
            cell.cameraCount?.text = String(camera.count)
        } else {
            //makes sure that the camera count never displays a value less than 0
            cell.cameraCount?.text = String(0)
        }
        
        
        if (camera.battery > 0)
        {
            //change the progress color depending on how much battery is left
            if (camera.battery > 70)
            {
                cell.cameraBattery.progressTintColor = UIColor.green
            } else if (camera.battery > 30) {
                cell.cameraBattery.progressTintColor = UIColor.yellow
            } else {
                cell.cameraBattery.progressTintColor = UIColor.red
            }
            //set the amount of progress
            let temp1 = Float(camera.battery)
            let temp2 = temp1 / 100
            cell.cameraBattery.setProgress(temp2, animated: true)
        } else {
            //makes sure that the camera battery never displays less than 0
            cell.cameraBattery.setProgress(0, animated: true)
        }
        
        
        return cell
    }
    
    
    // MARK: - Navigation (Segue)
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //find the selected game
        let cell = sender as! UITableViewCell
        let indexPath = camerasTableView.indexPath(for: cell)!
        //pass the selected game to the details view controller
        let cameraDetailsViewController = segue.destination as! CameraDetailsViewController
        
        //sets each variable's data to the destination's passedCamera
        let camera: Camera = allCameras[indexPath.row]
        cameraDetailsViewController.passedCamera.association = camera.association
        cameraDetailsViewController.passedCamera.location = camera.location
        cameraDetailsViewController.passedCamera.count = camera.count
        cameraDetailsViewController.passedCamera.battery = camera.battery
        
        //deselects the row
        camerasTableView.deselectRow(at: indexPath, animated: true)
    }*/

}
