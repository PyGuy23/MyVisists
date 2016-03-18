//
//  ViewController.swift
//  MyVisists
//
//  Created by newuser on 3/18/16.
//  Copyright © 2016 dwebman235. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    let manager = CLLocationManager()
    
    
    
    if CLLocationManager.locationServicesEnabled() {
    
    
    
    manager.startUpdatingLocation()
    }
    
    if CLLocationManager.authorizationStatus() ==   .NotDetermined{
    manager.requestAlwaysAuthorization()
    }
    
    #pragma or use this method
    
    
    if CLLocationManager.autorizationStatus() == .NotDetermined{
    manager.requestWhenInUseAuthorization()
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus)
    {
        if status == .AuthorizedAlways || status == .AuthorizedWhenInUse{
            manager.startUpdatingLocation()
            manager.startMonitoringVisits()
        }
    }
    
    switch CLLocationManager.authorizedStatus(){
    case .AuthorizedAleays:
    
    case .NotDetermined:
    
    manager.requestAlwaysAuthorization()
    
    case .AuthorizationHwhenInUs, .Restricted, .Denied:
    
    let alertController = UIAlertController(
    title: "Background Location Access Disabled",
    message: "In order to view people that visited certain areas, you must go to your settings and enable background location",
    preferredStyle: .Alert)
    
    
    let cancelAction = UIAlertAction(title:"Cancel", style: .Cancel, handler: nil)
    alertController.addAction(cancelAction)
    
    
    
    let openAction = UIAlertAction(title:"", style: .Default){(action) in
    
    if let url = NSURL(string:UIApplicationOpenSettingsURLString){
    
    UIApplication.sharedApplication().openURL(url)
    
    }
    
    }
    
    alertController.addAction(openAction)
    
    self.presentViewController(alertController, animated: true, completeion: nil)
    
    
    
    //backwards compatiability with ios7
    
    
    func triggerLocation(){
    if CLLocationManager.locationServicesEnabled(){
    if self.manager.respondsToSelector("requestWhenInUseAuthorization")
    
    }else{
    startUpdatingLocation()
    }
    }
    
    func startUpdatingLocation(){
    manager.startUpdatingLocation()
    
    
    
    }
    
    
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus){
    
    if status == .AuthorizedWhenInUse || status == .AuthorizedAlways{
    startUpdatingLocation()
    }
    }
    
    
    //monitor CLVisits where you visit and is not always accurate in iOS8.1
    
    
    func locationManager(manager: CLLocationManager!, didVisit visit: CLVisit()){
    
    if visit.departureDate.isEqualToDate(NSDate.distanceFuture){
    
    //the user has arrived, but not left the location
    
    }else{
    //the visit is complete
    }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

