//
//  DetailDescription.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import SwiftUI

struct DetailDescription: View {
    let description: String
    
    var body: some View {
        Text(description)
            .font(.caption)
            .padding(.top)
    }
}

struct DetailDescription_Previews: PreviewProvider {
    static var previews: some View {
        DetailDescription(
        	description: "Description"
        )
    }
}
