//
//  HotelCard.swift
//  HotelBookingApp
//
//  Created by Photchara Kallayanasiri on 14/5/2567 BE.
//

import SwiftUI

struct HotelCard: View {
    
    let hotel:HotelItem
    var offColor = Color.color3
    var onColor = Color.yellow
    
    var body: some View {
        HStack (spacing: 10){
            //Spacer().frame(width: 5,height: 0)
            AsyncImage(url: URL(string:hotel.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 130)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    
            } placeholder: {
                Image(systemName: "photo.fill")
                    .foregroundStyle(.color3)
            }.frame(width: 150,height: 150)
                
           
            
            
            VStack(alignment: .leading, spacing: 6){
                Text(hotel.name)
                    .font(.title3)
                    .lineLimit(1)
                    .foregroundStyle(.black)
                Text(hotel.address)
                    .font(.caption)
                    .lineLimit(1)
                    .foregroundStyle(.black)
                HStack (spacing : 1){
                    ForEach(1..<5 + 1, id: \.self) { number in
                        
                        Image(systemName: "star.fill")
                            .foregroundStyle(number > Int(hotel.rating) ? offColor : onColor)
                            
                        
                    }
                }
                Text("$" + String(hotel.price) + " per night")
                    .font(.subheadline)
                    .lineLimit(1)
                    .foregroundStyle(.black)
                
                
                
            }
            
            
            .frame(alignment: .leading)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            Spacer()
            

        }
        
        .frame(width: 340,height: 150)
        .padding([.trailing],1)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8,style: .continuous))
        //.shadow(color:Color.black.opacity(0.2),radius: 10,x: 0,y: 5)
    }
}
//struct CustomCorner: Shape {
//
//var corners : UIRectCorner
//var radius : CGFloat
//
//func path(in rect: CGRect)->Path{
//    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//    return Path(path.cgPath)
//}
//}

#Preview {
    HotelCard(hotel: HotelPreviewData)
}

