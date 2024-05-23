//
//  LogoView.swift
//  HotelBookingApp
//
//  Created by Photchara Kallayanasiri on 22/5/2567 BE.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack{
            Image("Icon")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 100,height: 100)
                
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.white)
    }
}

#Preview {
    LogoView()
}
