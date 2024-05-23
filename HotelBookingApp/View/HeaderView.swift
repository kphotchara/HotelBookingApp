//
//  HeaderView.swift
//  HotelBookingApp
//
//  Created by Photchara Kallayanasiri on 22/5/2567 BE.
//

import SwiftUI

struct HeaderView: View {
    let countProp:Int
    let height:CGFloat
    var body: some View {
        
            
            VStack{
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Text("Check Availability")
                    .font(.title)
                    .foregroundStyle(.white)
                    .bold()
                if height > 110 {
                    Text(String(countProp)+" properties available")
                        .font(.caption)
                        .foregroundStyle(.white)
                }
                Spacer()
            }
            
            .foregroundStyle(Color.black)
            .frame(maxWidth: .infinity,maxHeight: height)
            .background(Image("HotelBanner")
                .resizable()
                .aspectRatio(contentMode: .fill))
            .animation(.easeOut(duration: 0.3), value: height)
           
           
            
        }
    
}

#Preview {
    HeaderView(countProp: 8 ,height: 200)
}
