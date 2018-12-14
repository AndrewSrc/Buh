//
//  TestViewController.swift
//  buh
//
//  Created by Пользователь on 14/12/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let control = PriorityControl(frame: CGRect(x: 50, y: 50, width: 200, height: 50))
        view.addSubview(control)
    }

}
