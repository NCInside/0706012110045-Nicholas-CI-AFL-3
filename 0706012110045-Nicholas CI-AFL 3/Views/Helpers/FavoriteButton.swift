//
//  FavoriteButton.swift
//  0706012110045-Nicholas CI-AFL 3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

// The struct to represent a component of button favorite view in the shape of a star
struct FavoriteButton: View {
    @Binding var isSet: Bool

    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}

