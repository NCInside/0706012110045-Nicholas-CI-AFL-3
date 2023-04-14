//
//  Badge.swift
//  0706012110045-Nicholas CI-AFL 3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

// This struct represent the badge view components as a whole in complete
struct Badge: View {
    var badgeSymbols: some View {
        // Judge the angle in rotation to create a figure of 8 copy around a center
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground()
            
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}

