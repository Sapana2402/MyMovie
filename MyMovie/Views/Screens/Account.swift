//
//  Account.swift
//  MyMovie
//
//  Created by MACM26 on 19/08/25.
//

import SwiftUI

struct Account: View {
    var body: some View {
        NavigationStack{
            List{
                Section{
                    VStack{
                        Text("DeluxeAlonso")
                         .font(.headline)
                        Text("Alonso Alvarez")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            
                    }
                    .frame(maxWidth: .infinity,alignment: .center)
                    .padding(.vertical, 30)
                    
                    Section{
                            HStack{
                                Text(k.account.favorites)
                                    .foregroundColor(k.colorSet.lightBlue)
                                Spacer()
                                Image(systemName: k.iconSet.forwardArrow)

                            }
                            HStack{
                                Text(k.account.watchList)
                                    .foregroundColor(k.colorSet.lightBlue)
                                Spacer()
                                Image(systemName: k.iconSet.forwardArrow)

                            }
                       
                    }
                    
                    Spacer(minLength: 10)
                    SectionRow(title: k.account.recommended)
                    Spacer(minLength: 10)
                    SectionRow(title: k.account.createdList)
                    Spacer(minLength: 20)
                    Section{
                            HStack{
                                Text(k.account.signOut)
                                    .foregroundColor(.red)
                                    .frame(maxWidth: .infinity,alignment: .center)
                                    .padding(.all,20)
                                    .badge(10)

                            }
                    }
                }
            }
            .listStyle(InsetListStyle())
        }
    }
}

struct SectionRow: View {
    let title: String
    var body: some View {
        Section{
                HStack{
                    Text(title)
                        .foregroundColor(k.colorSet.lightBlue)
                    Spacer()
                    Image(systemName: k.iconSet.forwardArrow)
                }
        }
    }
}

#Preview {
    Account()
}
