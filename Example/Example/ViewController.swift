//
//  ViewController.swift
//  Example
//
//  Created by EyreFree on 2019/11/25.
//  Copyright © 2019 EFPrefix. All rights reserved.
//

import UIKit
import EFFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        printLog("2333")
        printLog(1 + 2)
        var xxx = CGRect.zero
        xxx.center = CGPoint.zero
        printLog("xxx:\(xxx)")
    }


}

