//
//  GenresVM.swift
//  MyMovie
//
//  Created by MACM26 on 25/08/25.
//

import Foundation

@MainActor
class GenresVM: ObservableObject{
    @Published var genresData: [GenresModelDetails]?
    @Published var isLoading: Bool = true
    
    func getchGenres()  async{
        print("inside gener VM")
        guard let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list?language=en") else {
            fatalError(k.errorMessages.invalidURL)}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.setValue(AuthManager.shared.authorization, forHTTPHeaderField: k.apiDetails.authorization)
        
        do{
            let (data,_) = try await URLSession.shared.data(for: request)
            let decode = try JSONDecoder().decode(GenresModel.self, from: data)
            genresData = decode.genres
            isLoading = false
        }catch{
            print("Something went wrong")
            isLoading = false
        }
    }
}
//
