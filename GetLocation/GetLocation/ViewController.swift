//
//  ViewController.swift
//  GetLocation
//
//  Created by Alexandr Yanski on 18.10.2018.
//  Copyright © 2018 Lonely Tree Std. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    var userLocation: CLLocation!
    var cityName: String!
    var countryName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations[0] as CLLocation
        let location = CLLocation(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            // Process Response
            if let error = error {
                print("Unable to Reverse Geocode Location (\(error))")
            } else {
                if let placemarks = placemarks, let placemark = placemarks.first {
                    self.cityName = placemark.locality!
                    
                    self.countryName = placemark.country!
                    
                    if let city = self.cityName {
                        if let country = self.countryName {
                            self.locationLabel.text = "\(city), \(country)"
                            self.locationLabel.isEnabled = true
                            self.locationManager.stopUpdatingLocation()
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }

}

