//
//  HotelModel.swift
//  HotelBookingApp
//
//  Created by Photchara Kallayanasiri on 14/5/2567 BE.
//

import Foundation


struct HotelItem: Codable {
    let _id: String
    let name: String
    let address: String
    let district: String?
    let province: String?
    let postalcode: String?
    let tel: String?
    let rating: Double
    let image: String?
    let price: Double
    let review: [ReviewItem]?

//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case name
//        case address, district, province, postalcode, tel, rating, image, price, review
//    }
}
struct HotelJson: Codable {
    let success : Bool
    let count : Int
    let data : [HotelItem]?
    
}

struct ReviewItem: Codable {
    let rating: Double
    let description: String
}

enum GHError:Error {
    case invalidUrl
    case invalidRes
    case invalidData
}
