//
//  MovieDetailsVM.swift
//  MyMovie
//
//  Created by MACM26 on 19/08/25.
//

import Foundation

@MainActor
class MovieDetailsVM: ObservableObject {
    @Published var mvDetails:MovieDetailsModel?
    @Published var isLoading: Bool = true

    func fetchMovieDetails(id: Int) async  {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?language=en-US") else {
            fatalError(k.errorMessages.invalidURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.setValue(AuthManager.shared.authorization, forHTTPHeaderField: "Authorization")
        
        do{
            let (data,_) = try await URLSession.shared.data(for: request)
            let decoder = try JSONDecoder().decode(MovieDetailsModel.self, from: data)
            mvDetails = decoder
            print("Details======",decoder)
            self.isLoading = false
        }catch{
            print("Somthing went wrong!!",error)
            self.isLoading = false
        }
    }
}
