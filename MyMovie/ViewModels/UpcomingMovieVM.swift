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
        let request = APIService.shared.handleAPI(urlNew: "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1")
        do{
            let (data,_) = try await URLSession.shared.data(for: request)
            let decoder = try JSONDecoder().decode(UpcomingMovieModel.self, from: data)
            upcomingMovieList = decoder.results
            self.isLoading = false
        }catch{
            print("Somthing went wrong!!",error)
            self.isLoading = false
        }
    }
}
