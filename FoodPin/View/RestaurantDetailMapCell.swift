//
//  RestaurantDetailMapCell.swift
//  FoodPin
//
//  Created by Chris Gaona on 4/27/21.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {
    
    @IBOutlet var mapView: MKMapView! {
        didSet {
            mapView.layer.cornerRadius = 20.0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
