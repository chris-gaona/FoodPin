//
//  RestaurantDiffableDataSource.swift
//  FoodPin
//
//  Created by Chris Gaona on 4/24/21.
//

import UIKit

enum Section {
    case all
}

class RestaurantDiffableDataSource: UITableViewDiffableDataSource<Section, Restaurant> {
    
    // Rows are non-editable by default so we have to explicitly set editable to true
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // itemIdentifier is an optional so it could return a Restaurant or nil
            if let restaurant = self.itemIdentifier(for: indexPath) {
                // Get a copy of the data source's current snapshot
                var snapshot = self.snapshot()
                snapshot.deleteItems([restaurant])
                // request table view to update it's UI with the updated snapshot
                self.apply(snapshot, animatingDifferences: true)
            }
        }
    }
}
