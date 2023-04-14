//
//  RotatedBadgeSymbol.swift
//  0706012110045-Nicholas CI-AFL 3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

// This struct represent the effect of tilt or rotation to a badge symbol
struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgeSymbol(angle: Angle(degrees: 5))
    }
}
