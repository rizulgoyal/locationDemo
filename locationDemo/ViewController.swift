//
//  ViewController.swift
//  locationDemo
//
//  Created by Rizul goyal on 2020-01-09.
//  Copyright © 2020 Rizul goyal. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    //create the variable of CLLocationManager
    var locationManager = CLLocationManager();

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        //print(userLocation)
        
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
                    
                    print(subthoroughFare + "\n" + thoroughFare`    ` + "\n" + subLocality + "\n" +
                    subAdministrativeArea + "\n" + postalCode + "\n" + country)
                }
            }
        }
    }
    


}

