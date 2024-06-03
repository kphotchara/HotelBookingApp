//
//  TabBar.swift
//  HotelBookingApp
//
//  Created by Photchara Kallayanasiri on 22/5/2567 BE.
//

import SwiftUI

enum Tab: String , CaseIterable{
    case house
    case person
    case bag
}

struct TabBar: View {
    
    @Binding var selectedTab:Tab
    private var fillImage:String {
        selectedTab.rawValue + ".fill"
    }
    private var tabColor : Color {
        switch selectedTab {
        case .bag:
            return Color.color1
        case .house:
            return Color.color1
        case .person:
            return Color.color1
        
        }
    }
        var body: some View {
            VStack{
                Spacer()
                Spacer()
                HStack{
                    
                
                    Spacer()
                    VStack {
                        Image(systemName: "house.fill").font(.system(size: 15))
                        Text("home").font(.caption2)
                    }
                    .foregroundColor(Tab.house == selectedTab ? Color.color1 : Color.color2)
                    .scaleEffect(Tab.house == selectedTab ? 1.1 : 1.0)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            selectedTab = Tab.house
                        }
                    }
                    Spacer()
                    
                    Spacer()
                    VStack {
                        Image(systemName: "bag.fill").font(.system(size: 15))
                        Text("?????").font(.caption2)
                    }
                    .foregroundColor(Tab.bag == selectedTab ? Color.color1 : Color.color2)
                    .scaleEffect(Tab.bag == selectedTab ? 1.1 : 1.0)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            selectedTab = Tab.bag
                        }
                    }
                    Spacer()
                    
                    Spacer()
                    VStack {
                        Image(systemName: "person.fill").font(.system(size: 15))
                        Text("profile").font(.caption2)
                    }
                    .foregroundColor(Tab.person == selectedTab ? Color.color1 : Color.color2)
                    .scaleEffect(Tab.person == selectedTab ? 1.1 : 1.0)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            selectedTab = Tab.person
                        }
                    }
                    Spacer()
                    
                    
                    
                        
                    
                }
                
            Spacer()
            Spacer()
            Spacer()
            }
            .frame(width: nil,height: 80)
            .background(.white)
            
        }
}

#Preview {
    TabBar(selectedTab: .constant(.house))
}
