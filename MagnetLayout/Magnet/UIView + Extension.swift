//
//  UIView + Extension.swift
//  MagnetLayout
//
//  Created by 정기욱 on 2020/01/15.
//  Copyright © 2020 kiwook. All rights reserved.
//

import UIKit

extension UIView {

    enum Direction {
         case top(UIView, NSLayoutConstraint.Attribute ,CGFloat = 0)
         case left(UIView, NSLayoutConstraint.Attribute ,CGFloat = 0)
         case right(UIView, NSLayoutConstraint.Attribute ,CGFloat = 0)
         case bottom(UIView, NSLayoutConstraint.Attribute ,CGFloat = 0)
         case width(CGFloat, UIView? = nil)
         case height(CGFloat, UIView? = nil)
        
        
        static func + (lhs: Direction, rhs: CGFloat) -> Direction {
            
            switch lhs {
            case .top(let view, let direction, let constant):
                return .top(view, direction, constant + rhs)
            case .left(let view, let direction, let constant):
                return .left(view, direction, constant + rhs)
            case .right(let view, let direction, let constant):
                return .right(view, direction, constant + rhs)
            case .bottom(let view, let direction, let constant):
                return .bottom(view, direction, constant + rhs)
            default:
                return lhs
            }
        }
        
        
     }
    
    func magnet(to : Direction...) {
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraintsArray = [NSLayoutConstraint]()
        for direction in to {
            switch direction {
            case .top(let view, let direction, let constant):
                let top = NSLayoutConstraint(item:       self,
                                             attribute:  .top,
                                             relatedBy:  .equal,
                                             toItem:     view,
                                             attribute:  direction,
                                             multiplier: 1.0,
                                             constant:   constant)
                constraintsArray.append(top)
                
            case .left(let view, let direction, let constant):
                let left = NSLayoutConstraint(item:       self,
                                             attribute:  .left,
                                             relatedBy:  .equal,
                                             toItem:     view,
                                             attribute:  direction,
                                             multiplier: 1.0,
                                             constant:   constant)
                constraintsArray.append(left)

            case .right(let view, let direction, let constant):
                let right = NSLayoutConstraint(item:       self,
                                             attribute:  .right,
                                             relatedBy:  .equal,
                                             toItem:     view,
                                             attribute:  direction,
                                             multiplier: 1.0,
                                             constant:   constant)
                constraintsArray.append(right)

            case .bottom(let view, let direction, let constant):
                let bottom = NSLayoutConstraint(item:       self,
                                             attribute:  .bottom,
                                             relatedBy:  .equal,
                                             toItem:     view,
                                             attribute:  direction,
                                             multiplier: 1.0,
                                             constant:   constant)
                constraintsArray.append(bottom)

            case .width(let constant, let view):
               if view == nil {
                    widthAnchor.constraint(equalToConstant: constant).isActive = true
                } else {
                    widthAnchor.constraint(equalTo: view!.widthAnchor, multiplier: 1.0, constant: constant).isActive = true
                }
            case .height(let constant, let view):
                if view == nil {
                     heightAnchor.constraint(equalToConstant: constant).isActive = true
                 } else {
                     heightAnchor.constraint(equalTo: view!.heightAnchor, multiplier: 1.0, constant: constant).isActive = true
                 }
            }
        }
        
        NSLayoutConstraint.activate(constraintsArray)
    }
    
    
    
   
}

