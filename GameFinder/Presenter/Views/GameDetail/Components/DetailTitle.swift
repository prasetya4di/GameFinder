//
//  DetailTitle.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import SwiftUI

struct DetailTitle: View {
    let title: String
    
    var body: some View {
        Text(title)
            .bold()
            .font(.title)
    }
}

struct DetailTitle_Previews: PreviewProvider {
    static var previews: some View {
        DetailTitle(
            title: "Grand Theft Auto 5"
        )
    }
}
