//
//  BrowseMainView.swift
//  Savory
//
//  Created by Junior Figuereo on 7/17/24.
//

import SwiftUI

struct Cuisine {
    let cuisine: FoodCuisines
    let selected: Bool
    let includes: [FoodItem]
}

struct BrowseMainView: View {
    @EnvironmentObject var appColors: AppColors
    let cuisineFilters: [Cuisine] = [
        .init(cuisine: .american, selected: false, includes: [.bbq, .burgers, .chicken, .fries, .sandwich, .soda, .smoothies]),
        .init(cuisine: .asian, selected: false, includes: [.seafood, .teriyaki, .eggroll, .ramen, .tea, .coffee, .salad, .rice, .vegan, .noodle]),
        .init(cuisine: .caribbean, selected: false, includes: [.tacos, .burritos, .quesadilla, .chicken, .spicy, .soup, .soda, .rice]),
        .init(cuisine: .african, selected: false, includes: [.stew, .curry, .spicy, .sesame, .chicken, .goat, .soup, .noodle]),
        .init(cuisine: .halal, selected: false, includes: [.sandwich, .stew, .curry, .sesame, .chicken, .salad, .pita, .vegan, .goat])
    ]
    @State private var cuisinesSelected: [Cuisine]? = nil
    @State private var typesSelected: [FoodItem]? = nil
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                Text("Savory")
                    .font(.custom(Font.greatVibes, size: Font.Headline1))
                
                VStack(spacing: 0) {
                    HStack {
                        Text("Filter by Cuisine:")
                        Spacer()
                    }
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            ForEach(FoodCuisines.allCases, id: \.self) { cuisine in
                                Text("\(cuisine.stringLit)")
                                    .onTapGesture {
                                        
                                    }
                            }
                        }
                    }
                    
                    HStack {
                        Text("Filter by Item:")
                        Spacer()
                    }
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            ForEach(FoodItem.allCases, id: \.self) { item in
                                Text("\(item.stringLit)")
                            }
                        }
                    }
                }
            }
            
        }
        .frame(maxWidth: .infinity)
    }
}
