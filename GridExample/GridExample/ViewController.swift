//
//  ViewController.swift
//  GridExample
//
//  Created by Simon Fortelny on 5/13/15.
//  Copyright (c) 2015 Simon Fortelny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        GridOverlay.gridColor = UIColor.redColor()
        GridOverlay.gridSize = CGSizeMake(30, 30)
        GridOverlay.show()
    }


}

