//
//  LoadMoreView.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import SwiftUI

struct LoadMoreView: View {
    var body: some View {
        VStack {
            Divider()
            
            LoadingView()
        }
    }
}

struct LoadMoreView_Previews: PreviewProvider {
    static var previews: some View {
        LoadMoreView()
    }
}
