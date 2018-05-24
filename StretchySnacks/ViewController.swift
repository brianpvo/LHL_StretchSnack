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
    var stackView: UIStackView!
    
    @IBOutlet weak var navBarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // IMAGES
        let oreos = UIImageView(image: #imageLiteral(resourceName: "oreos"))
        let pizzaPockets = UIImageView(image: #imageLiteral(resourceName: "pizza_pockets"))
        let popTarts = UIImageView(image: #imageLiteral(resourceName: "pop_tarts"))
        let popsicle = UIImageView(image: #imageLiteral(resourceName: "popsicle"))
        let ramen = UIImageView(image: #imageLiteral(resourceName: "ramen"))
        
        // STACKVIEW W/ IMAGES
        stackView = UIStackView(arrangedSubviews: [oreos, pizzaPockets, popTarts, popsicle, ramen])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.alignment = .fill
        navBarView.addSubview(stackView)
        
        // CONSTRAINTS
        stackView.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor, constant: 0).isActive = true
        stackView.leftAnchor.constraint(equalTo: navBarView.leftAnchor, constant: 0).isActive = true
        stackView.rightAnchor.constraint(equalTo: navBarView.rightAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: navBarView.topAnchor, constant: 100).isActive = true
        stackView.isHidden = true
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        self.navHeightConstraint.constant = self.navHeightConstraint.constant == 64 ? 200 : 64
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.stackView.isHidden = false
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

