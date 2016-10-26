//
//  ViewController.swift
//  Geotify
//
//  Created by Tyler Young on 10/19/16.
//  Copyright © 2016 Tyler Young. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    let locationManger = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManger.requestAlwaysAuthorization()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func zoomToCurrentLocation(_ sender: UIBarButtonItem) {
        mapView.zoomToUserLocation()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let addGeotificationViewController = navigationController.viewControllers.first as! AddGeotificationTableViewController
        addGeotificationViewController.viewController = self
    }
    
    var viewController: ViewController? = nil
    
    func addToMap(geotification: Geotification) {
        //drop the pin
        
        mapView.addAnnotation(geotification)
    }

}

