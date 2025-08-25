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
    @State var isCastShown: Bool = false
    let adaptive = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
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
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(mvDetails.mvDetails?.poster_path ?? "")")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                                .clipped()
                                .clipShape(SlantedShape())
                        } placeholder: {
                            ProgressView()
                                .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                        }
                        
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(mvDetails.mvDetails?.backdrop_path ?? "")")) { image in
                            image
                                .resizable()
                                .frame(width: 100, height: 150)
                                .cornerRadius(8)
                                .padding(.leading, 16)
                                .offset(y: 26)
                        } placeholder: {
                            ProgressView()
                                .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                        }

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
                            }else{
                                Text("-")
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
                    
                    HStack{
                        Text("Cast")
                        Spacer()
                        Image(systemName: isCastShown ? k.iconSet.upArrow : k.iconSet.downArrow)
                            .onTapGesture {
                                Task{
                                    await mvDetails.fetchCast(movieId: movieId)
                                }
                            }
                    }
                    .padding(.horizontal,16)
                    
                    if mvDetails.isCastLoading{
                        ProgressView()
                    }else{
                        LazyVGrid(columns: adaptive) {
                            ForEach(mvDetails.castDetails,id: \.id) { listItem in
                                ZStack{
                                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(listItem.profile_path)")) { image in
                                        image
                                            .resizable()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(8)
                                    } placeholder: {
                                        ProgressView()
                                            .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                                    }
                                    
                                    
                                    Rectangle()
                                           .fill(Color.black.opacity(0.5))
                                           .frame(width: 100, height: 150)
                                           .cornerRadius(8)

                                    VStack{
                                        Text(listItem.original_name)
                                            .font(.footnote)
                                            .foregroundStyle(.white)
                                            .fontWeight(.bold)
                                            .padding(.horizontal,5)
                                        
                                        Text(listItem.character)
                                            .multilineTextAlignment(.center)
                                            .font(.caption)
                                            .foregroundStyle(.white)
                                            .padding(.horizontal,5)
                                    }
                                }
                            }
                            
                        }
                    }
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
                                let shareURL = URL(string: "https://image.tmdb.org/t/p/w500\(mvDetails.mvDetails?.poster_path ?? "")")
                                    ?? URL(string: "https://image.tmdb.org")!   // fallback

                                ShareLink(item: shareURL, subject: Text(mvDetails.mvDetails?.original_title ?? "-"), message: Text(mvDetails.mvDetails?.release_date ?? "-")) {
                                    Image(systemName: k.iconSet.dots)
                                        .foregroundColor(.black)
                                }

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
