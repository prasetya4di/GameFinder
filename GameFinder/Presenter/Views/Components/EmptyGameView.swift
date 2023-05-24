//
//  EmptyView.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import SwiftUI

struct EmptyGameView: View {
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            
            Image(systemName: "questionmark.circle")
            
            Text("Ooppss we can't find any games for you, try to refresh this page or search for another keyword")
                .multilineTextAlignment(.center)
                .font(.caption)
            
            Spacer()
        }
        .foregroundColor(.gray)
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyGameView()
    }
}
