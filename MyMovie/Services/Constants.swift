//
//  Constants.swift
//  MyMovie
//
//  Created by MACM26 on 19/08/25.
//

import Foundation
import SwiftUI

struct k {
    struct tabs {
        static let upcomming = "Upcomming"
        static let search = "Search"
        static let account = "Account"
    }
    
    struct account {
        static let favorites = "Favorites"
        static let watchList = "WatchList"
        static let recommended = "Recommended"
        static let createdList = "Created List"
        static let signOut = "Sign Out"
    }
    
    struct upCommingScreen {
        static let title = "Upcoming Movie"
    }
    
    struct movieDetails {
        static let movieDetails = "Movie Details"
    }
    
    struct colorSet {
        static let lightBlue = Color("LightBlue")
    }
    
    struct iconSet{
        static let forwardArrow = "chevron.forward"
        static let backArrow = "chevron.backward"
        static let movieIcon = "film.fill"
        static let search = "magnifyingglass"
        static let person = "person.fill"
        static let dots = ""
    }
    
    struct errorMessages {
        static let invalidURL = "Invalid URL"
    }
}
