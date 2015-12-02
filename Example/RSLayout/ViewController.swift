//
//  ViewController.swift
//  RSLayout
//
//  Created by Roel Spruit on 30/11/15.
//  Copyright © 2015 DinkyWonder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var constraintGroup: ConstraintGroup?
    
    @IBOutlet var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testView.layoutCenter()
    }
    
    @IBAction func segmentChanged(sender: UISegmentedControl) {
        
        if let oldConstraints = constraintGroup {
            testView.clearConstraintGroup(oldConstraints)
        }
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.constraintGroup = self.testView.layoutFullWidth()
        case 1:
            self.constraintGroup = self.testView.layoutFullHeight()
        case 2:
            self.constraintGroup = self.testView.layoutFillSuperview()
        case 3:
            self.constraintGroup = self.testView.layoutSize(100)
        default:
            break
        }
        
        self.testView.setNeedsLayout()
        
        UIView.animateWithDuration(0.3) { () -> Void in
            
            self.testView.layoutIfNeeded()
        }
    }
    
    
}

