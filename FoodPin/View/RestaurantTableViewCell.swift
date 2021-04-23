//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by Chris Gaona on 4/19/21.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Set the cell's tint color for the checkmark
        self.tintColor = .systemYellow
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet var heartImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
//    @IBOutlet var thumbnailImageView: UIImageView!
    
    // The following is an alernative approach besides Interface Builder to add rounded corners to an image
    @IBOutlet var thumbnailImageView: UIImageView! {
        didSet {
            thumbnailImageView.layer.cornerRadius = 20.0
            thumbnailImageView.clipsToBounds = true // just like overflow: hidden
        }
    }
    
//    // The following makes the image circular
//    @IBOutlet var thumbnailImageView: UIImageView! {
//        didSet {
//            thumbnailImageView.layer.cornerRadius = thumbnailImageView.bounds.width / 2
//            thumbnailImageView.clipsToBounds = true
//        }
//    }
}
