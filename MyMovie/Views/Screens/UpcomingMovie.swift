//
//  UpcomingMovie.swift
//  MyMovie
//
//  Created by MACM26 on 19/08/25.
//

import SwiftUI

struct UpcomingMovie: View {
    @StateObject var upcomingMovideViewModel = UpcomingMovieVM()
    @State var isEnabled = false
    
    var adpative = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
//        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView{
                
                LazyVGrid(columns: isEnabled ?  [GridItem(.flexible())] : adpative){
                    ForEach(upcomingMovideViewModel.upcomingMovieList) { listItem in
                        NavigationLink {
                            MovieDetails(movieId: listItem.id)
                        } label: {
                            AsyncImage(url: URL(string:"https://image.tmdb.org/t/p/w500\(listItem.backdrop_path)"))
//                            Text(listItem.title)
                                .frame(maxWidth: isEnabled ? .infinity : 100, minHeight: 150 , maxHeight: 150)
                                .background(Color.brown)
                                .cornerRadius(5)
                                .padding(.bottom,20)
                        }

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
                        .onTapGesture {
                            isEnabled.toggle()
                        }
                }
            }
        }
    }
}

#Preview {
    UpcomingMovie()
}
