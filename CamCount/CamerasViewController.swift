//
//  CamerasViewController.swift
//  CamCount
//
//  Created by Paulina DeVito on 10/24/22.
//

import UIKit

class CamerasViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var camerasTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //FIXME: See why these aren't working.
        //tableView.dataSource = self
        //tableView.delegate = self
    }
    
    
    
    //MARK: - TableView Stubs
    //These stubs came with the UITableViewDataSource and UITableViewDelegate that were manually added in the "class" line at the start of the file.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20 //TODO: Change this according to the # of cameras we are pulling from Firebase.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        //cell.textLabel.text = "row: \(indexPath.row)"
        
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
