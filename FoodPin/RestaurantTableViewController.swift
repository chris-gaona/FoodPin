//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Chris Gaona on 4/19/21.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    lazy var dataSource = configureDataSource()
    
    enum Section {
        case all
    }
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurantNames, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, String> {
        let cellIdentifier = "datacell"
        
        let dataSource = UITableViewDiffableDataSource<Section, String>(
            tableView: tableView, cellProvider: { tableView, indexPath, restaurantName in let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
                
                cell.textLabel?.text = restaurantName
                cell.imageView?.image = UIImage(named: "restaurant")
                
                return cell
            }
        )
        return dataSource
    }
}
