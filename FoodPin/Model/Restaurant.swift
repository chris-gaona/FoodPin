//
//  Restaurant.swift
//  FoodPin
//
//  Created by Chris Gaona on 4/22/21.
//

import Foundation

struct Restaurant: Hashable {
    enum Rating: String {
        case awesome
        case good
        case okay
        case bad
        case terrible
        
        var image: String {
            switch self {
            case .awesome: return "love"
            case .good: return "cool"
            case .okay: return "happy"
            case .bad: return "sad"
            case .terrible: return "angry"
            }
        }
    }
    var name: String = ""
    var type: String = ""
    var location: String = ""
    var phone: String = ""
    var description: String = ""
    var image: String = ""
    var isFavorite: Bool = false
    var rating: Rating?
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
