//
//  BrowseTabEnums.swift
//  Savory
//
//  Created by Junior Figuereo on 7/17/24.
//

import Foundation

enum FoodCuisines: CaseIterable {
    case american
    case asian
    case caribbean
    case african
    case halal
    
    var stringLit: String {
        switch self {
        case .american:
            return "American"
        case .asian:
            return "Asian"
        case .caribbean:
            return "Caribbean"
        case .african:
            return "African"
        case .halal:
            return "Halal"
        }
    }
}

enum FoodItem: CaseIterable {
    case sandwich
    case smoothies
    case spicy
    case seafood
    case soup
    case vegan
    case tacos
    case burgers
    case pizza
    case quesadilla
    case chicken
    case bbq
    case burritos
    case fries
    case tea
    case coffee
    case soda
    case pita
    case sesame
    case teriyaki
    case salad
    case rice
    case ramen
    case noodle
    case eggroll
    case stew
    case curry
    case goat
    
    var stringLit: String {
        switch self {
        case .sandwich:
            return "Sandwich"
        case .smoothies:
            return "Smoothies"
        case .spicy:
            return "Spicy"
        case .seafood:
            return "Seafood"
        case .soup:
            return "Soup"
        case .vegan:
            return "Vegan"
        case .tacos:
            return "Tacos"
        case .burgers:
            return "Burgers"
        case .pizza:
            return "Pizza"
        case .quesadilla:
            return "Quesadilla"
        case .chicken:
            return "Chicken"
        case .bbq:
            return "BBQ"
        case .burritos:
            return "Burritos"
        case .fries:
            return "Fries"
        case .tea:
            return "Tea"
        case .coffee:
            return "Coffee"
        case .soda:
            return "Soda"
        case .pita:
            return "Pita"
        case .sesame:
            return "Sesame"
        case .teriyaki:
            return "Teriyaki"
        case .salad:
            return "Salad"
        case .rice:
            return "Rice"
        case .ramen:
            return "Ramen"
        case .noodle:
            return "Noodle"
        case .eggroll:
            return "Eggroll"
        case .stew:
            return "Stew"
        case .curry:
            return "Curry"
        case .goat:
            return "Goat"
        }
    }
}


