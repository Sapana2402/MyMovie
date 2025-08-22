//
//  MovieDetails.swift
//  MyMovie
//
//  Created by MACM26 on 19/08/25.
//

import SwiftUI

struct MovieOption: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let color: Color
}

struct MovieDetails: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var mvDetails = MovieDetailsVM()
    let movieId: Int
    
    let items: [MovieOption] = [
           MovieOption(title: "Reviews", icon: "star.bubble.fill", color: .green),
           MovieOption(title: "Trailers", icon: "play.circle.fill", color: .red),
           MovieOption(title: "Credits", icon: "theatermasks.circle.fill", color: .blue),
           MovieOption(title: "Similars", icon: "film.fill", color: .black)
       ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                if mvDetails.isLoading{
                    ProgressView()
                }else{
                    ZStack(alignment: .leading){
//                        Image("testing")
                        AsyncImage(url: URL(string:"https://image.tmdb.org/t/p/w500\(mvDetails.mvDetails?.poster_path ?? "")"))
//                            .resizable()
                            .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                            .clipShape(SlantedShape())
                        
                        Image("test")
                            .resizable()
                            .frame(width: 100, height: 150)
                            .cornerRadius(8)
                            .padding(.leading, 16)
                            .offset(y: 26)
                    }
                    HStack(spacing: 5){
                        Text(mvDetails.mvDetails?.original_title ?? "-")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("Rating")
                        
                    }
                    .padding(16)
                    
                    HStack(spacing: 0){
                        ForEach(items){item in
                            VStack(spacing: 8){
                                Image(systemName: item.icon)
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(item.color)
                                Text(item.title)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .overlay(
                                Rectangle()
                                    .stroke(Color.gray.opacity(0.4), lineWidth: 1))
                        }
                    }
                    
                    HStack{
                        VStack(spacing: 8){
                            Text("Genre")
                                .fontWeight(.bold)
                            if let genres = mvDetails.mvDetails?.genres {
                                   Text(genres.map { $0.name }.joined(separator: ", "))
                               }

                        }
                        .frame(maxWidth: .infinity)
                        
                        VStack(spacing: 8){
                            Text("Release")
                                .fontWeight(.bold)
                            Text(mvDetails.mvDetails?.release_date ?? "-")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding()
                    
                    Divider()
                    
                    Text(mvDetails.mvDetails?.overview ?? "-")
                        .padding()
                }
                    Spacer()
                    
                        .task {
                            await mvDetails.fetchMovieDetails(id: movieId)
                        }
                        .navigationTitle(Text(k.movieDetails.movieDetails))
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarBackButtonHidden(true)
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                Image(systemName: k.iconSet.backArrow)
                                    .onTapGesture {
                                        dismiss()
                                    }
                            }
                            
                            ToolbarItem(placement: .topBarTrailing) {
                                Image(systemName: k.iconSet.dots)
                            }
                        }
                }
            
        }
    }
    
    struct SlantedShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            // Start at top-left
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            // Top-right
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            // Bottom-right (height = 200)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            
            // Bottom-left (height = 100)
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + rect.height / 1.4))
            
            path.closeSubpath()
            return path
        }
    }

  
}

#Preview {
    MovieDetails(movieId: 0)
}
