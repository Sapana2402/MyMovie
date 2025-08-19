//
//  UpcomingMovieVM.swift
//  MyMovie
//
//  Created by MACM26 on 19/08/25.
//

import Foundation

@MainActor
class UpcomingMovieVM: ObservableObject {
    @Published var upcomingMovieList: [UpcomingMovieDetails] = []
    @Published var isLoading: Bool = true
    
    func fetchUpCommingMoview() async {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1&api_key=4c7852dcd8a44ea2b03e9ac958422f16") else {
                  fatalError("Invalid URL")
              }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.setValue("Bearer ACCESS_TOKEN eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0Yzc4NTJkY2Q4YTQ0ZWEyYjAzZTlhYzk1ODQyMmYxNiIsIm5iZiI6MTc0MzU5Mjg1MS41MzcsInN1YiI6IjY3ZWQxZDkzMGUyNjJjOWE1ZjAxM2NjMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3qX7Jbs8NvAwdxptva96Ys37IU7ikTuixJkXod858es", forHTTPHeaderField: "Authorization")
        do{
            let (data,_) = try await URLSession.shared.data(for: request)
            let decoder = try JSONDecoder().decode(UpcomingMovieModel.self, from: data)
            print("Decoded data",decoder)
            upcomingMovieList = decoder.results
            self.isLoading = false
        }catch{
            print("Somthing went wrong!!",error)
            self.isLoading = false
        }
    }
}
