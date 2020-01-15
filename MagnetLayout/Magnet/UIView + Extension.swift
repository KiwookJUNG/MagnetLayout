//
//  UIView + Extension.swift
//  MagnetLayout
//
//  Created by 정기욱 on 2020/01/15.
//  Copyright © 2020 kiwook. All rights reserved.
//

import UIKit

extension UIView {
    enum Direction2 {
        case top(NSLayoutYAxisAnchor, CGFloat)
        case left(NSLayoutXAxisAnchor, CGFloat)
        case right(NSLayoutXAxisAnchor, CGFloat)
        case bottom(NSLayoutYAxisAnchor, CGFloat)
        case width(NSLayoutDimension?, CGFloat)
        case height(NSLayoutDimension?, CGFloat)
    }
   
//    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
   func magnet2(direction : [Direction2]) {
       translatesAutoresizingMaskIntoConstraints = false
       for i in direction {
           switch i {
           case .top(let anchor, let constant):
               topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
           case .left(let anchor, let constant):
               leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
           case .right(let anchor, let constant):
               trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
           case .bottom(let anchor, let constant):
               bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
           case .height(let anchor, let constant):
               if anchor == nil {
                   widthAnchor.constraint(equalToConstant: constant).isActive = true
               } else {
                   widthAnchor.constraint(equalTo: anchor!, multiplier: 1.0, constant: constant).isActive = true
               }
           case .width(let anchor, let constant):
               if anchor == nil {
                   heightAnchor.constraint(equalToConstant: constant).isActive = true
               } else {
                   heightAnchor.constraint(equalTo: anchor!, multiplier: 1.0, constant: constant).isActive = true
               }
           }
       }
   }
    
    
    enum Direction {
         case top(UIView, NSLayoutConstraint.Attribute ,CGFloat)
         case left(UIView, NSLayoutConstraint.Attribute ,CGFloat)
         case right(UIView, NSLayoutConstraint.Attribute ,CGFloat)
         case bottom(UIView, NSLayoutConstraint.Attribute , CGFloat)
         case width(UIView?, CGFloat)
         case height(UIView?, CGFloat)
     }
    
    func magnet(direction : Direction...) {
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraintsArray = [NSLayoutConstraint]()
        for i in direction {
            switch i {
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

            case .width(let view, let constant):
               if view == nil {
                    widthAnchor.constraint(equalToConstant: constant).isActive = true
                } else {
                    widthAnchor.constraint(equalTo: view!.widthAnchor, multiplier: 1.0, constant: constant).isActive = true
                }
            case .height(let view, let constant):
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
