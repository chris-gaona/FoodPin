//
//  RestaurantDetailHeaderView.swift
//  FoodPin
//
//  Created by Chris Gaona on 4/25/21.
//

import UIKit

class RestaurantDetailHeaderView: UIView {
    
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.numberOfLines = 0
        }
    }
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var heartButton: UIButton!
    
}
