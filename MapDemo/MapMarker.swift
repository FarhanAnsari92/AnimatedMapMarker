//
//  MapMarker.swift
//  MapDemo
//
//  Created by Mohammad Farhan on 10/16/18.
//  Copyright © 2018 Mohammad Farhan. All rights reserved.
//

import UIKit
import GoogleMaps

class MapMarker: UIView {
    
    @IBOutlet var viewLeading: NSLayoutConstraint!
    @IBOutlet var viewTop: NSLayoutConstraint!
    
    var isViewOnTop: Bool = true
    var isViewOnLeft: Bool = true
    
    let animationTime: TimeInterval = 0.2

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "MapMarker", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

    func moveMaker(_ gmsMapView: GMSMapView, marker: GMSMarker, bounds: CGRect) {
        if gmsMapView.projection.point(for: marker.position).x - (self.frame.width / 2) < 0 {
            self.viewLeading.constant = 5.0 + self.frame.width / 2
            UIView.animate(withDuration: animationTime, animations: {
                self.layoutIfNeeded()
            })
        }
        
        if gmsMapView.projection.point(for: marker.position).y - (self.frame.height) < 0 {
            self.viewTop.constant = 5.0 + self.frame.height / 2
            UIView.animate(withDuration: animationTime, animations: {
                self.layoutIfNeeded()
            })
        }
        
        if gmsMapView.projection.point(for: marker.position).x + (self.frame.width / 2) > bounds.width {
            self.viewLeading.constant = 0
            UIView.animate(withDuration: animationTime, animations: {
                self.layoutIfNeeded()
            })
        }
        
        if gmsMapView.projection.point(for: marker.position).y + (self.frame.height / 2) > bounds.height {
            
            self.viewTop.constant = 0
            UIView.animate(withDuration: animationTime, animations: {
                self.layoutIfNeeded()
            })
        }
        
    }

}
