//
//  ViewController.swift
//  MapDemo
//
//  Created by Mohammad Farhan on 10/16/18.
//  Copyright © 2018 Mohammad Farhan. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate {
    
    @IBOutlet weak var gmsMapView: GMSMapView!
    let coordinates = CLLocationCoordinate2D(latitude: 24.9234848, longitude: 67.0504784)
    var marker: GMSMarker!
    var markerView = MapMarker.instanceFromNib() as! MapMarker
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withTarget: coordinates, zoom: 15)
        self.gmsMapView.camera = camera
        
        self.marker = GMSMarker(position: self.coordinates)
        markerView.backgroundColor = UIColor.clear
        
        marker.iconView = markerView
        marker.map = self.gmsMapView
        
        self.gmsMapView.delegate = self
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        self.markerView.moveMaker(mapView, marker: self.marker, bounds: self.view.bounds)
    }
    
//    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
//        if self.gmsMapView.projection.point(for: self.marker.position).x - (self.markerView.frame.width / 2) < 0 {
//            markerView.viewLeading.constant = 5.0 + markerView.frame.width / 2
//            UIView.animate(withDuration: 0.3, animations: {
//                self.view.layoutIfNeeded()
//            })
//        }
//
//        if self.gmsMapView.projection.point(for: self.marker.position).y - (self.markerView.frame.height / 2) < 0 {
//
//            markerView.viewTop.constant = 5.0 + markerView.frame.height / 2
//            UIView.animate(withDuration: 0.3, animations: {
//                self.view.layoutIfNeeded()
//            })
//        }
//
//        if self.gmsMapView.projection.point(for: self.marker.position).x + (self.markerView.frame.width / 2) > self.view.bounds.width {
//            markerView.viewLeading.constant = 0
//            UIView.animate(withDuration: 0.3, animations: {
//                self.view.layoutIfNeeded()
//            })
//        }
//
//        if self.gmsMapView.projection.point(for: self.marker.position).y + (self.markerView.frame.height / 2) > self.view.bounds.height {
//
//            markerView.viewTop.constant = 0
//            UIView.animate(withDuration: 0.3, animations: {
//                self.view.layoutIfNeeded()
//            })
//        }
//    }
}

