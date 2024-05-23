//
//  SwiftUIView.swift
//  HotelBookingApp
//
//  Created by Photchara Kallayanasiri on 15/5/2567 BE.
//

import SwiftUI

struct ContentView2: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            Button {
                path.append("NewView")
            } label: {
                Text("Show NewView")
            }
            .navigationDestination(for: String.self) { view in
                if view == "NewView" {
                    Text("This is NewView")
                }
            }
        }
    }
}


#Preview {
    ContentView2()
}
