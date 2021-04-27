//
//  UIColor+Ext.swift
//  FoodPin
//
//  Created by Chris Gaona on 4/26/21.
//

import UIKit

// To declare an extension for an existing class, you start with the keyword extension followed by the class you want to extend.
extension UIColor {
    // Additional convenience initializer that accepts three parameters
    convenience init(red: Int, green: Int, blue: Int) {
        // Perform the conversions
        let redValue = CGFloat(red) / 255.0
        let greenValue = CGFloat(green) / 255.0
        let blueValue = CGFloat(blue) / 255.0
        
        // Call the original init method with the converted RGB components
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
}
