//
//  Plate.swift
//  SavePlates
//
//  Created by Sam Roman on 12/18/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//


import Foundation
import FirebaseFirestore

struct Plate {
    let description: String
    let imageURL: String
    let restaurant: String
    let restaurantID: String
    let plateID: String
    let userID: String?
    let claimStatus: Bool = false
    let plateCount: Int
    let dateCreated: Date?
    let originalPrice: Double
    let discount: Double
    let tags: [String]
    let pickupStatus: Bool
    
    //    MARK: - Init
    
    init(description: String, imageURL: String, restaurant: String, restaurantID: String, plateID: String, userID: String, plateCount: Int, dateCreated: Date? = nil, originalPrice: Double, discount: Double, tags: [String], pickupStatus: Bool) {
        self.description = description
        self.imageURL = imageURL
        self.restaurant = restaurant
        self.restaurantID = restaurantID
        self.plateID = plateID
        self.userID = userID
        self.plateCount = plateCount
        self.dateCreated = dateCreated
        self.originalPrice = originalPrice
        self.discount = discount
        self.tags = tags
        self.pickupStatus = pickupStatus
    }
    
    init?(from dict: [String:Any], id: String) {
        guard let description = dict["description"] as? String,
            let imageURL = dict["imageURL"] as? String,
            let restaurant = dict["restaurant"] as? String,
            let restaurantID = dict["restaurantID"] as? String,
            let plateID = dict["plateID"] as? String,
            let userID = dict["userID"] as? String,
            let plateCount = dict["plateCount"] as? Int,
            let dateCreated = (dict["dateCreated"] as? Timestamp)?.dateValue(),
            let originalPrice = dict["originalPrice"] as? Double,
            let discount = dict["discount"] as? Double,
            let tags = dict["tags"] as? [String],
            let pickupStatus = dict["pickupStatus"] as? Bool else {return nil}
        
        self.description = description
        self.imageURL = imageURL
        self.restaurant = restaurant
        self.restaurantID = restaurantID
        self.plateID = plateID
        self.userID = userID
        self.plateCount = plateCount
        self.dateCreated = dateCreated
        self.originalPrice = originalPrice
        self.discount = discount
        self.tags = tags
        self.pickupStatus = pickupStatus
    }
    var fieldsDict: [String: Any] {
        return ["description": self.description, "imageURL": self.imageURL, "restaurant": self.restaurant, "restaurantID": self.restaurantID, "plateID": self.plateID, "userID": self.userID ?? "", "plateCount": self.plateCount, "originalPrice": self.originalPrice, "discount": self.discount, "tags": self.tags, "pickupStatus": self.pickupStatus]
    }
}
