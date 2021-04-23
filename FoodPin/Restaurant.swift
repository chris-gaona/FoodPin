//
//  Restaurant.swift
//  FoodPin
//
//  Created by Chris Gaona on 4/22/21.
//

import Foundation

struct Restaurant: Hashable {
    var name: String = ""
    var type: String = ""
    var location: String = ""
    var image: String = ""
    var isFavorite: Bool = false
}

/* The more verbose way to create this same struct from above
    struct Restaurant {
        var name: String
        var type: String
        var location: String
        var image: String
        var isFavorite: Bool
        
        init(name: String, type: String, location: String, image: String, isFavorite: Bool) {
            self.name = name
            self.type = type
            self.location = location
            self.image = image
            self.isFavorite = isFavorite
        }
        
        // Convenience initializer...can call Restaurant() & get the following result
        init() {
            self.init(name: "", type: "", location: "", image: "", isFavorite: false)
        }
    }
 */
