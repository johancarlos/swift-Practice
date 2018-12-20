//
//  MapViewController.swift
//  foodStore
//
//  Created by Estudiante on 12/19/18.
//  Copyright © 2018 ucb. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let theSpan:MKCoordinateSpan = MKCoordinateSpanMake(0.01 , 0.01)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 45.612125, longitude: 22.948280)
        
        let theRegion:MKCoordinateRegion = MKCoordinateRegionMake(location, theSpan)
        mapView.setRegion(theRegion, animated: true)
        
        let anotation = MKPointAnnotation()
        anotation.coordinate = location
        anotation.title = "The Location"
        anotation.subtitle = "This is the location !!!"
        mapView.addAnnotation(anotation)
        // custom marker
        let longPress = UILongPressGestureRecognizer(target: self, action: Selector(("action:")))
        longPress.minimumPressDuration = 1.0
        mapView.addGestureRecognizer(longPress)
        
        // Do any additional setup after loading the view.


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func action(gestureRecognizer:UIGestureRecognizer) {
        let touchPoint = gestureRecognizer.location(in: self.mapView)
        var newCoord:CLLocationCoordinate2D = mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
        
        let newAnotation = MKPointAnnotation()
        
        newAnotation.coordinate = newCoord
        newAnotation.title = "New Location"
        newAnotation.subtitle = "New Subtitle"
        mapView.addAnnotation(newAnotation)
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
