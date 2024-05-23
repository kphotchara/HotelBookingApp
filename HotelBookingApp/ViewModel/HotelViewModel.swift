//
//  HotelViewModel.swift
//  HotelBookingApp
//
//  Created by Photchara Kallayanasiri on 14/5/2567 BE.
//

import Foundation
import Combine

class HotelViewModel:ObservableObject {
    func getHotels() async throws -> HotelJson {
        let endPoint = "https://hotel-booking-backend-git-main-kawinwats-projects.vercel.app/api/v1/hotels/"
        
        guard let url = URL(string:endPoint) else {
            throw GHError.invalidUrl
        }
        
        let (data , response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,response.statusCode == 200 else {
            throw GHError.invalidRes
        }
        
        do {
            //print(String(data: data, encoding: .utf8)!)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(HotelJson.self, from: data)
        } catch{
            throw GHError.invalidData
        }
    }
   
}

