//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Chris Gaona on 4/29/21.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    var restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = UIImage(named: restaurant.image)
    }
}
