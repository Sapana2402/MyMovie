//
//  UpcomingMovie.swift
//  MyMovie
//
//  Created by MACM26 on 19/08/25.
//

import SwiftUI

struct UpcomingMovie: View {
    @StateObject var upcomingMovideViewModel = UpcomingMovieVM()
    var adpative = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
//        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVGrid(columns: adpative){
                    ForEach(upcomingMovideViewModel.upcomingMovieList) { listItem in
                        //                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(listItem.backdrop_path)"))
                        Text(listItem.title)
                            .frame(width: 100, height: 150)
                            .background(Color.brown)
                            .cornerRadius(5)
                            .padding(.bottom,20)
                    }
                }
                .task{
                    await upcomingMovideViewModel.fetchUpCommingMoview()
                }
            }
            .navigationTitle(Text(k.upCommingScreen.title))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: k.iconSet.movieIcon)
                        .foregroundColor(k.colorSet.lightBlue)
                }
            }
        }
    }
}

#Preview {
    UpcomingMovie()
}
