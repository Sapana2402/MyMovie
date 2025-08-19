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
                
                SearchScreen()
                    .tabItem {
                        Image(systemName: k.iconSet.search)
                        Text(k.tabs.search)
                    }
                
                Account()
                    .tabItem {
                        Image(systemName: k.iconSet.person)
                        Text(k.tabs.account)
                    }
        }
    }
}

#Preview {
    ContentView()
}
