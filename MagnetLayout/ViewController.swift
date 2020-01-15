//
//  ViewController.swift
//  MagnetLayout
//
//  Created by 정기욱 on 2020/01/15.
//  Copyright © 2020 kiwook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var redView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }()
    
    var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    var greenView: UIView = {
         let view = UIView()
         view.backgroundColor = .systemGreen
         return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(redView)
        self.view.addSubview(blueView)
        self.view.addSubview(greenView)
        
        
        
        redView.magnet(direction: .top(self.view, .top, 50), .left(self.view, .left, 50),
                                  .width(nil, 50), .height(nil, 200))
        
        blueView.magnet(direction: .top(redView, .top, 0), .left(redView, .right, 10),
                                   .width(nil, 100), .height(nil, 200))
        
        greenView.magnet(direction: .top(blueView, .bottom, 20), .left(redView, .left, 0),
                                    .width(nil, 150), .height(nil, 100))
        
    }


}

