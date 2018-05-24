//
//  ViewController.swift
//  StretchySnacks
//
//  Created by Brian Vo on 2018-05-23.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var navHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    var stackView: UIStackView!
    var images = [UIImageView]()
    
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
        
        
        setTapGestureForImage(imageView: oreos, tag: 0)
        setTapGestureForImage(imageView: pizzaPockets, tag: 1)
        setTapGestureForImage(imageView: popTarts, tag: 2)
        setTapGestureForImage(imageView: popsicle, tag: 3)
        setTapGestureForImage(imageView: ramen, tag: 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCell
        cell.setup(tag: images[indexPath.row].tag)
        return cell
    }
    
    func createOreo() -> UIImageView {
        return UIImageView(image: #imageLiteral(resourceName: "oreos"))
    }
    
    func createPizzaPocket() -> UIImageView {
        return UIImageView(image: #imageLiteral(resourceName: "pizza_pockets"))
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        self.navHeightConstraint.constant = self.navHeightConstraint.constant == 64 ? 200 : 64
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
                self.stackView.isHidden = false
                self.stackView.isUserInteractionEnabled = true
                self.view.layoutIfNeeded()
                if self.navHeightConstraint.constant == 200 {
                    sender.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                }
                else {
                    sender.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
                }
                
            }, completion: nil)
    }
    
    func setTapGestureForImage(imageView: UIImageView, tag: Int) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGesture:)))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        imageView.tag = tag
    }
    
    @objc func imageTapped(tapGesture: UITapGestureRecognizer) {
        let image = tapGesture.view as! UIImageView
        images.append(image)
        collectionView.reloadData()
    }

}

