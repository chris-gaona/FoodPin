//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Chris Gaona on 4/24/21.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    var restaurant: Restaurant!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RestaurantDetailHeaderView!
    @IBOutlet var favoriteBarButton: UIBarButtonItem!
    
    @IBAction func close(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func rateRestaurant(segue: UIStoryboardSegue) {
        // Make sure an identifier exists first
        guard let identifier = segue.identifier else {
            return
        }
        
        dismiss(animated: true, completion: {
            if let rating = Restaurant.Rating(rawValue: identifier) {
                self.restaurant.rating = rating
                self.headerView.ratingImageView.image = UIImage(named: rating.image)
            }
            
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                appDelegate.saveContext()
            }
            
            let scaleTransform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
            self.headerView.ratingImageView.transform = scaleTransform
            self.headerView.ratingImageView.alpha = 0
            
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.7, options: [], animations: {
                self.headerView.ratingImageView.transform = .identity
                self.headerView.ratingImageView.alpha = 1
            }, completion: nil)
        })
    }
    
    @IBAction func saveFavorite() {
        restaurant.isFavorite.toggle()
        
        configureFavoriteIcon()
        
        // Save the changes to the database
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            appDelegate.saveContext()
        }
    }
    
    func configureFavoriteIcon() {
        let heartImage = restaurant.isFavorite ? "heart.fill" : "heart"
        let heartIconConfiguration = UIImage.SymbolConfiguration(pointSize: 25, weight: .semibold)
        favoriteBarButton.tintColor = restaurant.isFavorite ? .systemYellow : .white
        favoriteBarButton.image = UIImage(systemName: heartImage, withConfiguration: heartIconConfiguration)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = ""
        
        configureFavoriteIcon()
        
        // Configure header view
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.headerImageView.image = UIImage(data: restaurant.image)
        
        // Configure data source
        tableView.delegate = self
        tableView.dataSource = self
        
        // Remove cell separator from table
        tableView.separatorStyle = .none
        
        // The following shifts the table view upwards towards the top edge of the screen
        tableView.contentInsetAdjustmentBehavior = .never
        
        // Makes the rating display when this screen is first loaded
        if let rating = restaurant.rating {
            headerView.ratingImageView.image = UIImage(named: rating.image)
        }
    }
    
    // viewWillAppear is used when the controller is about to appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Make sure the navigation bar is showing
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showMap":
            let destinationController = segue.destination as! MapViewController
            
            // Assigning restaurant found in MapViewController with a value here
            destinationController.restaurant = restaurant
            
        case "showReview":
            let destinationController = segue.destination as! ReviewViewController
            
            // Assigning restaurant found in ReviewViewController with a value here
            destinationController.restaurant = restaurant
        default:
            break
        }
    }
}

extension RestaurantDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
            
            cell.descriptionLabel.text = restaurant.summary
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTwoColumnCell.self), for: indexPath) as! RestaurantDetailTwoColumnCell
            
            cell.column1TitleLabel.text = "Address"
            cell.column1TextLabel.text = restaurant.location
            cell.column2TitleLabel.text = "Phone"
            cell.column2TextLabel.text = restaurant.phone
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
            // configure method is defined in RestaurantDetailMapCell
            cell.configure(location: restaurant.location)
            cell.selectionStyle = .none
            
            return cell
            
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller")
            
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
