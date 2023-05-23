//
//  PlaytimeText.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import SwiftUI

struct PlaytimeText: View {
    let playtime: Int
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "gamecontroller")
            Text("\(playtime) Hours")
                .foregroundColor(.gray)
        }
    }
}

struct PlaytimeText_Previews: PreviewProvider {
    static var previews: some View {
        PlaytimeText(
        	playtime: 79
        )
    }
}
