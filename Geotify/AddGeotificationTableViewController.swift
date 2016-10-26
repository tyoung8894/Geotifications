//
//  AddGeotificationTableViewController.swift
//  Geotify
//
//  Created by Tyler Young on 10/19/16.
//  Copyright © 2016 Tyler Young. All rights reserved.
//

import UIKit
import MapKit
class AddGeotificationTableViewController: UITableViewController {

    @IBOutlet weak var radiusTextField: UITextField!
   
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var entryOfExitSegmentControl: UISegmentedControl!
    
    var viewController: ViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    @IBAction func onCancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true , completion: nil )
    }
   
    @IBAction func zoomToCurrentLocation(_ sender: UIBarButtonItem) {
        mapView.zoomToUserLocation()
    }
    
    @IBAction func addGeotification(_ sender: UIBarButtonItem) {
        
        guard let radius = Double(radiusTextField.text!) else {
            showAlert(withTitle: "Geotify", message: "radius is not an integer")
            return
        }
        
        if radius < 0.0 || radius > 100000.0 {
            showAlert(withTitle: "Geotify", message: "radius is an invalid integer")
            return
        }
        
        let note = noteTextField.text!
        if note == "" {
            showAlert(withTitle: "Geotify", message: "bad note field")
            return
        }
        
        let onEntry = (entryOfExitSegmentControl.selectedSegmentIndex == 0)
        
        let geotification = Geotification(coordinate: mapView.centerCoordinate, radius: radius, note: note, onEntry: onEntry)
        
        //tell the main map about the new geotification
        viewController?.addToMap(geotification: geotification)
        
        //clear the text fields
        radiusTextField.text = ""
        noteTextField.text = ""
    }
    
}
