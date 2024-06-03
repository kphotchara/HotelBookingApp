import SwiftUI

struct ContentView: View {
    
    @ObservedObject var hotelVM = HotelViewModel()
    @State private var hotel: HotelJson?
    @State private var isLoading: Bool = true
    @State private var headerHeight: CGFloat = 175
    @State private var scrollOffset: CGFloat = 0
    @State private var tabSelected: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
       //UITabBar.appearance().isTranslucent = false
    }
    var body: some View {
        NavigationView(content: {
            ZStack{
                if isLoading {
                    LogoView()
                }
                else {
                    
                    VStack {
                        TabView(selection: $tabSelected,
                                    content:  {
                                
                                VStack (spacing:0){
                                    HeaderView(countProp: hotel?.count ?? 0, height: headerHeight)
                                        ScrollView {
                                            
                                            GeometryReader { geometry in
                                                Color.red.preference(key: ScrollOffsetKey.self, value: geometry.frame(in: .named("scroll")).origin.y)
                                                    
                                            }.frame(width: 0,height: 15)
                                            .onPreferenceChange(ScrollOffsetKey.self) { value in
                                                scrollOffset = value
                                                let newHeight = min(200,max(100, 175 - (-scrollOffset)))
                                                if headerHeight != newHeight {
                                                    headerHeight = newHeight
                                                }
                                            }
                                            LazyVStack (spacing : 20){
                                
                                                ForEach(Array(hotel?.data ?? []),id: \._id){hotel in
                                                    NavigationLink {
                                                        HotelDatailView(hotel: hotel)
                                                    } label: {
                                                        HotelCard(hotel: hotel)
                                                            .shadow(color:Color.black.opacity(0.2),radius: 10,x: 0,y: 5)
                                                    }.buttonStyle(PlainNavigationLinkStyle())
                                                        
                                                    
                                                    
                                                }
                                                Spacer().frame(height: 45)
                                                
                                            }.background(Color.white)
                                            
                                            
                                        }
                                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0))
                                        .coordinateSpace(name: "scroll")
                                        .refreshable {
                                            do {
                                                try await hotel = hotelVM.getHotels()
                                                isLoading = false
                                                
                                            }catch{
                                                print("error")
                                                isLoading = false
                                            }
                                        }
                                        
                                    }.background(Color.white)
                                    .tabItem { Text("Book") }.tag(Tab.house)
                                     .ignoresSafeArea()
                                LoginPage().tabItem { Text("Profile") }.tag(Tab.person)
                                Text("???").tabItem { }.tag(Tab.bag)
                        })
                    }
                    VStack{
                        Spacer()
                        TabBar(selectedTab: $tabSelected)
                    }
                        
                        
                    

                    
                    
                }
                
                
                
                
                
            }.task{
                do {
                    try await hotel = hotelVM.getHotels()
                    isLoading = false
                    
                }catch{
                    print("error")
                    isLoading = false
                }
            }
            .ignoresSafeArea(.all)
            
        })
       
        
        
            
    }
    
}

struct PlainNavigationLinkStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color.clear)
            .opacity(configuration.isPressed ? 1 : 1)
            //.scaleEffect(configuration.isPressed ? 1.05 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


#Preview {
    ContentView().buttonStyle(PlainNavigationLinkStyle())
}
