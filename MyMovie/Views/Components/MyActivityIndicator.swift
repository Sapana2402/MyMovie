//
//  MyActivityIndicator.swift
//  MyMovie
//
//  Created by MACM26 on 25/08/25.
//

import SwiftUI
import ActivityIndicatorView

struct MyActivityIndicator: View {
    var body: some View {
        ActivityIndicatorView(isVisible: .constant(true), type: .arcs(count: 5, lineWidth: 2))
            .frame(width: 30, height: 30)
    }
}

#Preview {
    MyActivityIndicator()
}
