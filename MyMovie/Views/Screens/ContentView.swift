//
//  ContentView.swift
//  MyMovie
//
//  Created by MACM26 on 18/08/25.
//

import SwiftUI

struct ContentView: View {
     @State var selectedTab: Int = 0
    
    var body: some View {
            TabView(selection: $selectedTab) {
                UpcomingMovie()
                    .tabItem {
                        Image(systemName: k.iconSet.movieIcon)
                        Text(k.tabs.upcomming)
                    }
                    .tag(0)
                
                SearchScreen()
                    .tabItem {
                        Image(systemName: k.iconSet.search)
                        Text(k.tabs.search)
                    }
                    .tag(1)
                
                Account()
                    .tabItem {
                        Image(systemName: k.iconSet.person)
                        Text(k.tabs.account)
                    }
                    .tag(2)
        }
    }
}

#Preview {
    ContentView()
}
