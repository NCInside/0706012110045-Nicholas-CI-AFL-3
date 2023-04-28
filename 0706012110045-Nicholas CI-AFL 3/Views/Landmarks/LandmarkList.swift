//
//  LandmarkList.swift
//  0706012110045-Nicholas CI-AFL 3
//
//  Created by MacBook Pro on 14/04/23.
//

import SwiftUI

// The struct to represent rows of landmarks and their name in a list
struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?

    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"

        var id: FilterCategory { self }
    }

    //filtering based on categories or favorites
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
                && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }

    //title based on filter selected
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }

    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }

    var body: some View {
        NavigationView {
            List(selection: $selectedLandmark) {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)

                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }

            Text("Select a Landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}

