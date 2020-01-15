//
//  UIView + Extension.swift
//  MagnetLayout
//
//  Created by 정기욱 on 2020/01/15.
//  Copyright © 2020 kiwook. All rights reserved.
//

import UIKit

extension UIView {

    struct ConstantValue {
        var constant: CGFloat
        var multiplier: CGFloat
        
        init(constant: CGFloat = 0.0, multiplier: CGFloat = 1.0) {
            self.constant = constant
            self.multiplier = multiplier
        }
    }
    
    enum Direction {
        
         case top(to: UIView, NSLayoutConstraint.Attribute ,ConstantValue = ConstantValue())
         case left(to: UIView, NSLayoutConstraint.Attribute ,ConstantValue = ConstantValue())
         case right(to: UIView, NSLayoutConstraint.Attribute ,ConstantValue = ConstantValue())
         case bottom(to: UIView, NSLayoutConstraint.Attribute ,ConstantValue = ConstantValue())
        
         case width(CGFloat, UIView? = nil)
         case height(CGFloat, UIView? = nil)
        
         case safeArea(NSLayoutConstraint.Attribute ,ConstantValue = ConstantValue())
        
        
        static func + (lhs: Direction, rhs: CGFloat) -> Direction {
            
            switch lhs {
                
                case .safeArea(let direction, let constant):
                    return .safeArea(direction, ConstantValue(constant: constant.constant + rhs, multiplier: 1.0) )
                    
                case .top(let view, let direction, let constant):
                    return .top(to: view, direction, ConstantValue(constant: constant.constant + rhs, multiplier: 1.0))
                    
                case .left(let view, let direction, let constant):
                    return .left(to: view, direction, ConstantValue(constant: constant.constant + rhs, multiplier: 1.0))
                    
                case .right(let view, let direction, let constant):
                    return .right(to: view, direction, ConstantValue(constant: constant.constant + rhs, multiplier: 1.0))
                    
                case .bottom(let view, let direction, let constant):
                    return .bottom(to: view, direction, ConstantValue(constant: constant.constant + rhs, multiplier: 1.0))
                    
                default:
                    return lhs
            }
        }
        
        static func * (lhs: Direction, rhs: CGFloat) -> Direction {
                  
              switch lhs {
                  
                  case .safeArea(let direction, let constant):
                    return .safeArea(direction, ConstantValue(constant: constant.constant, multiplier: constant.multiplier * rhs) )
                      
                  case .top(let view, let direction, let constant):
                      return .top(to: view, direction, ConstantValue(constant: constant.constant, multiplier: constant.multiplier * rhs))
                      
                  case .left(let view, let direction, let constant):
                      return .left(to: view, direction, ConstantValue(constant: constant.constant, multiplier: constant.multiplier * rhs))
                      
                  case .right(let view, let direction, let constant):
                      return .right(to: view, direction, ConstantValue(constant: constant.constant, multiplier: constant.multiplier * rhs))
                      
                  case .bottom(let view, let direction, let constant):
                      return .bottom(to: view, direction, ConstantValue(constant: constant.constant, multiplier: constant.multiplier * rhs))
                      
                  default:
                      return lhs
              }
        }
    
        
        
     }
    
    
    
    func magnet(_ to : Direction...) {
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
                                             multiplier: constant.multiplier,
                                             constant:   constant.constant)
                constraintsArray.append(top)
                
            case .safeArea(let direction, let constant):
                let safeArea = NSLayoutConstraint(item: self,
                                                     attribute: direction,
                                                     relatedBy: .equal,
                                                     toItem: self.superview?.safeAreaLayoutGuide,
                                                     attribute: direction,
                                                     multiplier: constant.multiplier,
                                                     constant: constant.constant)
                constraintsArray.append(safeArea)
                
            case .left(let view, let direction, let constant):
                let left = NSLayoutConstraint(item:       self,
                                             attribute:  .left,
                                             relatedBy:  .equal,
                                             toItem:     view,
                                             attribute:  direction,
                                             multiplier: constant.multiplier,
                                             constant:   constant.constant)
                constraintsArray.append(left)

            case .right(let view, let direction, let constant):
                let right = NSLayoutConstraint(item:       self,
                                             attribute:  .right,
                                             relatedBy:  .equal,
                                             toItem:     view,
                                             attribute:  direction,
                                             multiplier: constant.multiplier,
                                             constant:   constant.constant)
                constraintsArray.append(right)

            case .bottom(let view, let direction, let constant):
                let bottom = NSLayoutConstraint(item:       self,
                                             attribute:  .bottom,
                                             relatedBy:  .equal,
                                             toItem:     view,
                                             attribute:  direction,
                                             multiplier: constant.multiplier,
                                             constant:   constant.constant)
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

