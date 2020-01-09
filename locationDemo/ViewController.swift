//
//  ViewController.swift
//  locationDemo
//
//  Created by Rizul goyal on 2020-01-09.
//  Copyright © 2020 Rizul goyal. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: MKMapView!
    //create the variable of CLLocationManager
    var locationManager = CLLocationManager();

    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   mapView.showsUserLocation = true
        
        // new comment
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        //print(userLocation)
        
        let lat = userLocation.coordinate.latitude
        let lang = userLocation.coordinate.longitude
        
        let latDelta : CLLocationDegrees = 0.05
            let longDelta : CLLocationDegrees = 0.05
            
            //defione span
            let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
            
            // define location
            
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lang)
            
            // define the region
            
            let region = MKCoordinateRegion(center: location, span: span)
            
            // set the region on the map
            mapView.setRegion(region, animated: true)
            
            //adding annotation for the map
            
            let annotation = MKPointAnnotation()
            annotation.title = "Current Place"
            annotation.subtitle = "Lets take the tour"
            annotation.coordinate = location
            mapView.addAnnotation(annotation)
        
        CLGeocoder().reverseGeocodeLocation(userLocation){(placemarks, error) in
            if let error = error
            {
                print(error)
            }
            else
            {
                if let placemark = placemarks?[0]{
                    var subthoroughFare = ""
                    if placemark.subThoroughfare != nil{
                        subthoroughFare = placemark.subThoroughfare!
                    }
                    
                    var thoroughFare = ""
                    if placemark.thoroughfare != nil{
                        thoroughFare = placemark.thoroughfare!
                    }
                    
                    var subLocality = ""
                    if placemark.subLocality != nil{
                        subLocality = placemark.subLocality!
                    }
                    
                    var subAdministrativeArea = ""
                    if placemark.subAdministrativeArea != nil{
                        subAdministrativeArea = placemark.subAdministrativeArea!
                    }
                    
                    var postalCode = ""
                    if placemark.postalCode != nil{
                        postalCode = placemark.postalCode!
                    }
                    
                    var country = ""
                    if placemark.country != nil{
                        country = placemark.country!
                    }
                    
                    print(subthoroughFare + "\n" + thoroughFare + "\n" + subLocality + "\n" +
                    subAdministrativeArea + "\n" + postalCode + "\n" + country)
                }
            }
        }
    }
    


}

