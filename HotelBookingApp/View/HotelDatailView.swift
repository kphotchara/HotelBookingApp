//
//  HotelDatailView.swift
//  HotelBookingApp
//
//  Created by Photchara Kallayanasiri on 17/5/2567 BE.
//

import SwiftUI

struct HotelDatailView: View {
    let hotel:HotelItem
    var body: some View {
        VStack{
            
            AsyncImage(url: URL(string:hotel.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
            } placeholder: {
                Image(systemName: "photo.fill")
                    .foregroundStyle(.color3)
            }.frame(width: 300,height: 200)
            
            
            
            HStack (alignment:.lastTextBaseline){
                Text(String(hotel.name))
                    .font(.title3)
                Spacer()
                Text("$" + String(hotel.price))
                    .font(.title3)
                Text("/ night")
                    .font(.caption)
                    .foregroundStyle(.color1)
            }
                
                
            
            Spacer()
        }
        .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
        .frame(maxWidth: .infinity)
        .background(Color.white)
        
    }
}

#Preview {
    HotelDatailView(hotel: HotelPreviewData)
}
