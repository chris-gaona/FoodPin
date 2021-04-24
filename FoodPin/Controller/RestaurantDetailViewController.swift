//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Chris Gaona on 4/24/21.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    @IBOutlet var restaurantImageView: UIImageView!
        
    var restaurantImageName = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImageView.image = UIImage(named: restaurantImageName)
        
        // disable large titles
        navigationItem.largeTitleDisplayMode = .never
    }
}
