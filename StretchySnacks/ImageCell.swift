//
//  ImageCell.swift
//  StretchySnacks
//
//  Created by Brian Vo on 2018-05-24.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(tag: Int) {
        switch tag {
        case 0:
            imageView.image = #imageLiteral(resourceName: "oreos")
        case 1:
            imageView.image = #imageLiteral(resourceName: "pizza_pockets")
        case 2:
            imageView.image = #imageLiteral(resourceName: "pop_tarts")
        case 3:
            imageView.image = #imageLiteral(resourceName: "popsicle")
        case 4:
            imageView.image = #imageLiteral(resourceName: "ramen")
        default:
            print("unidentified tag")
        }
    }
}
