//
//  GameReleaseDate.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import SwiftUI

struct GameReleaseDate: View {
    let releaseDate: Date
    
    private var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        return dateFormatter.string(from: releaseDate)
    }
    
    var body: some View {
        Text("Release date : \(formattedDate)")
            .font(.caption)
            .foregroundColor(.gray)
    }
}

struct GameReleaseDate_Previews: PreviewProvider {
    static var previews: some View {
        GameReleaseDate(
            releaseDate: .now
        )
    }
}
