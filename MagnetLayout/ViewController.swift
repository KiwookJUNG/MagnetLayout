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
    
    var pinkView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    var textLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "ddddddddddddddddd"
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(pinkView)
        self.view.addSubview(redView)
        self.view.addSubview(blueView)
        self.view.addSubview(greenView)
        self.view.addSubview(textLabel)
        
        pinkView.magnet(.fillSuper())
        
        redView.magnet(.safeArea(.top) + 100,
                       .safeArea(.left) + 100,
                       .width(50),
                       .height(200))
        
        blueView.magnet(.top(to: redView, .top),
                        .left(to: redView, .right) + 50,
                        .width(100),
                        .height(200))
        
        greenView.magnet(.top(to: blueView, .bottom) + 50,
                         .left(to: redView, .left),
                         .width(150),
                         .height(100))
        
        textLabel.magnet(.top(to: greenView, .bottom) + 100,
                         .safeArea(.right) + (-100))
    
    }
}


