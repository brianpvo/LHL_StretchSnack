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
        self.navHeightConstraint.constant = self.navHeightConstraint.constant == 64 ? 200 : 64
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
                if self.navHeightConstraint.constant == 200 {
                    sender.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                }
                else {
                    sender.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
                }
                
            }, completion: nil)
    }

}

