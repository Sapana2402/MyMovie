//
//  SearchScreen.swift
//  MyMovie
//
//  Created by MACM26 on 19/08/25.
//

import SwiftUI

struct SearchScreen: View {
    @StateObject var genresData = GenresVM()
    @State var searchValue: String = ""
    var body: some View {
        NavigationStack{
            
            TextField("Search", text: $searchValue)
                .padding(.all,10)
                .background(k.colorSet.lightGray)
                .cornerRadius(10)
                .padding(.horizontal,16)
                .padding(.vertical,10)
                
            
            Group{
                if genresData.isLoading {
                    ProgressView("Loading Genres...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    if let genres = genresData.genresData {
                        List {
                            Section(header: Text("Movie Genres")) {
                                ForEach(genres, id: \.id) { details in
                                    HStack {
                                        Text(details.name)
                                            .foregroundStyle(k.colorSet.lightBlue)
                                        Spacer()
                                        Image(systemName: k.iconSet.forwardArrow)
                                            .foregroundStyle(k.colorSet.lightBlue)
                                    }
                                }
                            }
                        }
                        .listStyle(GroupedListStyle())
                    } else {
                        Text("No genres available")
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
            
            .task {
                if genresData.genresData == nil {
                      print("inside task - fetching once")
                      await genresData.getchGenres()
                  }
            }
            .navigationTitle("Search Movies")
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .bottomBar) {
//                    TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .frame(width: .infinity)
//                }
//            }
        }
    
    }
}

#Preview {
    SearchScreen()
}
