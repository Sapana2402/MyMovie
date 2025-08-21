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
               

                ZStack(alignment: .leading){
                    Image("testing")
                        .resizable()
                        .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
                        .clipShape(SlantedShape())
                    
                    Image("test")
                        .resizable()
                        .frame(width: 100, height: 150)
                        .cornerRadius(8)
                        .padding(.leading, 16)
                        .offset(y: 26)
                }
                
                HStack{
                    Text("Memory")
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
                        Text("Action")
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack(spacing: 8){
                        Text("Release")
                            .fontWeight(.bold)
                        Text("2022-04-28")
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
                
                Divider()
                
                Text("Krrish 3 is a 2013 Indian Hindi-language superhero sci fi film written, produced and directed by Rakesh Roshan,[6] who wrote the screenplay with Honey Irani and Robin Bhatt. It is the third film in the Krrish series, following Koi... Mil Gaya (2003) and Krrish (2006).[7] The film stars Hrithik Roshan, Vivek Oberoi, Priyanka Chopra and Kangana Ranaut. In the film, Krishna Mehra, also known as Krrish, with his wife, Priya Mehra, and his scientist father, Rohit Mehra, face an elaborate conspiracy orchestrated by the mad scientist Kaal and his gang of mutants, led by the ruthless Kaya.Krrish 3 is a 2013 Indian Hindi-language superhero sci fi film written, produced and directed by Rakesh Roshan,[6] who wrote the screenplay with Honey Irani and Robin Bhatt. It is the third film in the Krrish series, following Koi... Mil Gaya (2003) and Krrish (2006).[7] The film stars Hrithik Roshan, Vivek Oberoi, Priyanka Chopra and Kangana Ranaut. In the film, Krishna Mehra, also known as Krrish, with his wife, Priya Mehra, and his scientist father, Rohit Mehra, face an elaborate conspiracy orchestrated by the mad scientist Kaal and his gang of mutants, led by the ruthless Kaya.")
                    .padding()
                
                Spacer()
                    .navigationTitle(Text(k.movieDetails.movieDetails))
//                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Image(systemName: k.iconSet.backArrow)
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
