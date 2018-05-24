//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Brian Vo on 2018-05-23.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var navHeightConstraint: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        self.navHeightConstraint.constant = 200
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        }
    }

}

