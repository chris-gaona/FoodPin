//
//  NavigationController.swift
//  FoodPin
//
//  Created by Chris Gaona on 4/26/21.
//

import UIKit

class NavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }

}
