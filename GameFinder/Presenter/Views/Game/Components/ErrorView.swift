//
//  ErrorView.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import SwiftUI

struct ErrorView: View {
    let message: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "exclamationmark.triangle")
            
            Text(message)
                .font(.caption)
        }
        .foregroundColor(.gray)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(
        	message: "Error happen, try to refresh"
        )
    }
}
