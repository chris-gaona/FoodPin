//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Chris Gaona on 4/24/21.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    @IBOutlet var infoStackView: UIStackView! {
        didSet {
            infoStackView.layer.cornerRadius = 20.0
        }
    }
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
        
    var restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantImageView.image = UIImage(named: restaurant.image)
        nameLabel.text = restaurant.name
        locationLabel.text = restaurant.location
        typeLabel.text = restaurant.type
        
        // disable large titles
        navigationItem.largeTitleDisplayMode = .never
    }
}
