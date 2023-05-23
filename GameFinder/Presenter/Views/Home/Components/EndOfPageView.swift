//
//  EndOfPageView.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import SwiftUI

struct EndOfPageView: View {
    var body: some View {
        VStack(spacing: 8) {
            Divider()
            
            Image(systemName: "face.smiling")
            
            Text("Ooppss, this is the end of the page, try to refresh or search with another keyword :)")
                .multilineTextAlignment(.center)
        }
        .foregroundColor(.gray)
    }
}

struct EndOfPageView_Previews: PreviewProvider {
    static var previews: some View {
        EndOfPageView()
    }
}
