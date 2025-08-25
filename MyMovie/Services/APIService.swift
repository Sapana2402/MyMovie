//
//  APIService.swift
//  MyMovie
//
//  Created by MACM26 on 18/08/25.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    func handleAPI(urlNew: String)-> URLRequest {
        guard let url = URL(string: urlNew) else {
            fatalError(k.errorMessages.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = k.methods.g
        request.timeoutInterval = 10
        request.setValue(AuthManager.shared.authorization, forHTTPHeaderField: k.apiDetails.authorization)
        return request
    }
}
