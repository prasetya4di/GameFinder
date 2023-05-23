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
            Text(convertToHoursMinutes(playtime))
                .foregroundColor(.gray)
        }
    }
    
    func convertToHoursMinutes(_ totalMinutes: Int) -> String {
        let hours = totalMinutes / 60
        let minutes = totalMinutes % 60
        
        let hourString = hours > 0 ? "\(hours) hour" + (hours > 1 ? "s" : "") : ""
        let minuteString = minutes > 0 ? "\(minutes) minute" + (minutes > 1 ? "s" : "") : ""
        
        var result = ""
        
        if !hourString.isEmpty {
            result += hourString
        }
        
        if !minuteString.isEmpty {
            if !result.isEmpty {
                result += " "
            }
            result += minuteString
        }
        
        return result.isEmpty ? "0 minutes" : result
    }
}

struct PlaytimeText_Previews: PreviewProvider {
    static var previews: some View {
        PlaytimeText(
        	playtime: 79
        )
    }
}
