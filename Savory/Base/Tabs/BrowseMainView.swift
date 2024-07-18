//
//  BrowseMainView.swift
//  Savory
//
//  Created by Junior Figuereo on 7/17/24.
//

import SwiftUI

struct Store: Hashable {
    let cuisine: FoodCuisines
    var selected: Bool
    let includes: [FoodItem]
}

struct BrowseMainView: View {
    @EnvironmentObject var appColors: AppColors
    @State private var stores: [Store] = [
        .init(cuisine: .american, selected: false, includes: [.bbq, .burgers, .chicken, .fries, .sandwich, .soda, .smoothies, .pizza]),
        .init(cuisine: .asian, selected: false, includes: [.seafood, .teriyaki, .eggroll, .ramen, .tea, .coffee, .salad, .rice, .vegan, .noodle]),
        .init(cuisine: .caribbean, selected: false, includes: [.tacos, .burritos, .quesadilla, .chicken, .spicy, .soup, .soda, .rice]),
        .init(cuisine: .african, selected: false, includes: [.stew, .curry, .spicy, .sesame, .chicken, .goat, .soup, .noodle]),
        .init(cuisine: .halal, selected: false, includes: [.sandwich, .stew, .curry, .sesame, .chicken, .salad, .pita, .vegan, .goat])
    ]
    @State private var foodItemsSelected: [FoodItem] = []
    
    var body: some View {
        VStack {
            Text("Savory")
                .font(.custom(Font.greatVibes, size: Font.Headline1))
            ScrollView(.vertical) {
                VStack(spacing: 10) {
                    VStack(spacing: 0) {
                        ScrollView(.horizontal) {
                            HStack(spacing: 5) {
                                ForEach(stores, id: \.self) { store in
                                    Text("\(store.cuisine.stringLit)")
                                        .background(store.selected ? appColors.mainLightRed : appColors.mainPurple)
                                        .onTapGesture {
                                            if let index = stores.firstIndex(where: {$0.cuisine == store.cuisine}) {
                                                stores[index].selected.toggle()
                                            }
                                        }
                                }
                            }
                        }
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 5) {
                                ForEach(FoodItem.allCases, id: \.self) { item in
                                    Text("\(item.stringLit)")
                                        .background(foodItemsSelected.contains(item) ? appColors.mainLightRed : appColors.mainPurple)
                                        .onTapGesture {
                                            if let index = foodItemsSelected.firstIndex(where: {$0.stringLit == item.stringLit}) {
                                                foodItemsSelected.remove(at: index)
                                            } else { foodItemsSelected.append(item) }
                                        }
                                }
                            }
                        }
                    }
                    BrowseStoresView(stores: $stores, foodItemsSelected: $foodItemsSelected)
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct BrowseStoresView: View {
    @Binding var stores: [Store]
    @Binding var foodItemsSelected: [FoodItem]
    var body: some View {
        VStack {
            ForEach(Int.random(in: 1...3)...Int.random(in: 3...8), id: \.self) { index in
                ForEach(stores, id: \.self) { store in
                    if store.selected {
                        let randomizedItems = store.includes.randomized(with: nil)
                        StoreDetailedView(store: Store(cuisine: store.cuisine, selected: store.selected, includes: randomizedItems))
                    }
                }
            }
            
            
            ForEach(Int.random(in: 1...3)...Int.random(in: 3...8), id: \.self) { index in
                ForEach(foodItemsSelected, id: \.self) { item in
                    ForEach(stores, id: \.self) { store in
                        if store.includes.contains(item) {
                            let randomizedItems = store.includes.randomized(with: item)
                            StoreDetailedView(store: Store(cuisine: store.cuisine, selected: store.selected, includes: randomizedItems))
                        }
                    }
                }
            }
        }
    }
}

struct StoreDetailedView: View {
    let store: Store
    var body: some View {
        VStack {
            Text("\(store.cuisine.stringLit)")
                .background(Color.white)
            HStack {
                ForEach(store.includes, id: \.self) { item in
                    Text("\(item.stringLit)")
                        .background(Color.white)
                }
            }
        }
        .overlay (
            RoundedRectangle(cornerRadius: 3)
                .stroke(lineWidth: 3)
                .foregroundStyle(Color.white)
        )
    }
}

extension [FoodItem] {
    func randomized(with: FoodItem?) -> [FoodItem] {
        var result: [FoodItem] = []
        
        for item in self {
            let randomBool = Bool.random()
            if randomBool {
                result.append(item)
            }
        }
        
        if let item = with {
            if !result.contains(item) {
                result.append(item)
            }
        }
        
        return result
    }
}
