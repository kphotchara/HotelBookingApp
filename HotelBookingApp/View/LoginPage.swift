//
//  LoginPage.swift
//  HotelBookingApp
//
//  Created by Photchara Kallayanasiri on 19/5/2567 BE.
//

import SwiftUI



struct LoginPage: View {
    
    @State private var username:String = ""
    @State private var password:String = ""
    @State private var wrongInput:Int=0
    var body: some View {
        VStack(alignment : .center,spacing: 20){
            
            Text("Login")
                .font(.largeTitle)
                .bold()
            TextField("Username", text: $username)
                .padding()
                .frame(width: 300,height: 50 )
                .background(Color.color3.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.red, lineWidth: CGFloat(wrongInput))
                )
            
            SecureField("Password", text: $password)
                .padding()
            
                .frame(width: 300,height: 50 )
                .background(Color.color3.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.red, lineWidth: CGFloat(wrongInput))
                    )
            //Spacer().frame(height: 30)
            Button("Login") {
                print(String(username+password))
            }
            .frame(width: 300,height: 40)
            .background(Color.color3)
            .foregroundColor(.color1)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            
            Button("Create new account") {
                
            }
            .foregroundColor(.color1)
            .font(.footnote)
           
        }.ignoresSafeArea(.all)
    }
}

#Preview {
    LoginPage()
}
