//
//  MovieDetails.swift
//  MyMovie
//
//  Created by MACM26 on 19/08/25.
//

import SwiftUI

struct MovieDetails: View {
    var body: some View {
        NavigationStack{
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
            
            HStack(spacing: 10){
                VStack(spacing: 8){
                    Image(systemName: k.iconSet.movieIcon)
                    Text("Reviews")
                }
                .frame(alignment: .center)
                Divider()
                VStack(spacing: 8){
                    Image(systemName: k.iconSet.movieIcon)
                    Text("Reviews")
                }
                Divider()
                VStack(spacing: 8){
                    Image(systemName: k.iconSet.movieIcon)
                    Text("Reviews")
                }
                Divider()
                VStack(spacing: 8){
                    Image(systemName: k.iconSet.movieIcon)
                    Text("Reviews")
                }
            }
            .frame(width: .infinity, height: 80)
            .background(Color.gray)
            .padding(16)
            
            Spacer()
                .navigationTitle(Text(k.movieDetails.movieDetails))
                .navigationBarTitleDisplayMode(.inline)
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
    MovieDetails()
}
