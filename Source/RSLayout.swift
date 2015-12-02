//
//  RSLayout.swift
//  RSLayout
//
//  Created by Roel Spruit on 30/11/15.
//  Copyright © 2015 DinkyWonder. All rights reserved.
//

import Foundation
import UIKit

struct ConstraintGroup {
    var constraints: [NSLayoutConstraint]
}

extension UIView {
    
    /// Remove a group of constraints from the views superview
    func clearConstraintGroup(group: ConstraintGroup){
        if let supView = superview {
            supView.removeConstraints(group.constraints)
        }
    }
    
    /// Adds constraints to assign a fixed width to the view
    func layoutWidth(width: Double) -> ConstraintGroup {
        return addConstraintsToSuperview(visualFormat("H:[self(\(width))]", views: ["self" : self]))
    }
    
    /// Adds constraints to assign a fixed height to the view
    func layoutHeight(height: Double) -> ConstraintGroup {
        return addConstraintsToSuperview(visualFormat("V:[self(\(height))]", views: ["self" : self]))
    }
    
    /// Adds constraints to assign a fixed width and height to the view
    func layoutSize(size: Double) -> ConstraintGroup {
        let widthGroup  = layoutWidth(size)
        let heightGroup = layoutHeight(size)
        
        return addConstraintsToSuperview(widthGroup.constraints + heightGroup.constraints)
    }
    
    /// Adds constraints to fill the width of the view to its superview (with an optional margin)
    func layoutFullWidth(margin: Double = 0) -> ConstraintGroup {
        return addConstraintsToSuperview(visualFormat("H:|-(\(margin))-[self]-(\(margin))-|", views: ["self" : self]))
    }
    
    /// Adds constraints to fill the height of the view to its superview (with an optional margin)
    func layoutFullHeight(margin: Double = 0) -> ConstraintGroup {
        return addConstraintsToSuperview(visualFormat("V:|-(\(margin))-[self]-(\(margin))-|", views: ["self" : self]))
    }
    
    /// Adds constraints to fill the view to its superview (with an optional margin)
    func layoutFillSuperview(margin: Double = 0) -> ConstraintGroup {
        let widthGroup  = layoutFullWidth(margin)
        let heightGroup = layoutFullHeight(margin)
        
        return addConstraintsToSuperview(widthGroup.constraints + heightGroup.constraints)
    }
    
    /// Adds constraints to center the view horizontally in its superview
    func layoutCenterHorizontally() -> ConstraintGroup {
        
        guard let supView = self.superview else {
            return ConstraintGroup(constraints: [NSLayoutConstraint]())
        }
            
        let centerXConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: supView,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0.0)
        
        supView.addConstraint(centerXConstraint)
        return ConstraintGroup(constraints: [centerXConstraint])
    }
    
    /// Adds constraints to center the view vertically in its superview
    func layoutCenterVertically() -> ConstraintGroup {
        
        guard let supView = self.superview else {
            return ConstraintGroup(constraints: [NSLayoutConstraint]())
        }
        
        let centerXConstraint = NSLayoutConstraint(item: self,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: supView,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1.0,
            constant: 0.0)
        
        supView.addConstraint(centerXConstraint)
        return ConstraintGroup(constraints: [centerXConstraint])
    }
    
    /// Adds constraints to center the view in its superview
    func layoutCenter() -> ConstraintGroup {
        
        let horizontalGroup = layoutCenterHorizontally()
        let verticalGroup = layoutCenterVertically()
        
        return ConstraintGroup(constraints: horizontalGroup.constraints + verticalGroup.constraints)
    }
    
    /// Adds the given set of constraints to the views superview
    private func addConstraintsToSuperview(constraints: [NSLayoutConstraint]) -> ConstraintGroup {
        
        guard let supView = self.superview else {
            return ConstraintGroup(constraints: [NSLayoutConstraint]())
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        supView.addConstraints(constraints)
        
        return ConstraintGroup(constraints: constraints)
    }
}

func visualFormat(format: String, options: NSLayoutFormatOptions = NSLayoutFormatOptions(), metrics: [String : AnyObject]? = nil, views: [String : AnyObject]) -> [NSLayoutConstraint] {
    return NSLayoutConstraint.constraintsWithVisualFormat(format, options: options, metrics: metrics, views: views)
}