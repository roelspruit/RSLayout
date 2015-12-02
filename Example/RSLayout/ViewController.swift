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
    var sizeGroup: ConstraintGroup?
    
    var testView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testView.backgroundColor = UIColor.redColor()
        view.addSubview(testView)
        
        sizeGroup = testView.layoutSize(100)
        testView.layoutCenter()
    }
    
    @IBAction func segmentChanged(sender: UISegmentedControl) {
        
        if let oldConstraints = constraintGroup {
            testView.clearConstraintGroup(oldConstraints)
        }
        
        if let oldSizeConstraints = sizeGroup {
            testView.clearConstraintGroup(oldSizeConstraints)
        }
        
        switch sender.selectedSegmentIndex {
        case 0:
            sizeGroup = testView.layoutHeight(100)
            constraintGroup = testView.layoutFullWidth()
        case 1:
            sizeGroup = testView.layoutWidth(100)
            constraintGroup = testView.layoutFullHeight()
        case 2:
            constraintGroup = testView.layoutFillSuperview()
        case 3:
            constraintGroup = testView.layoutSize(100)
        default:
            break
        }
        
        self.testView.setNeedsLayout()
        
        UIView.animateWithDuration(0.3) { () -> Void in
            self.testView.layoutIfNeeded()
        }
    }
    
    
}

