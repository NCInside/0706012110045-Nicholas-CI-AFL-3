//
//  CategoryRow.swift
//  0706012110045-Nicholas CI-AFL 3
//
//  Created by MacBook Pro on 18/04/23.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {

            HStack(alignment: .top, spacing: 0) {
                ForEach(items) { landmark in
                    CategoryItem(landmark: landmark)
                }
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow()
    }
}
