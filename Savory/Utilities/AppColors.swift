//
//  AppColors.swift
//  Savory
//
//  Created by Junior Figuereo on 7/15/24.
//

import Foundation
import SwiftUI



class AppColors: ObservableObject {
    init() {}
    @Published var darkMode: Bool = false
    @Published var background: Color = Color.init(hex: "#1D1A39")
    @Published var mainPurple: Color = Color.init(hex: "#451952")
    @Published var mainDarkRed: Color = Color.init(hex: "#662549")
    @Published var mainLightRed: Color = Color.init(hex: "#AE445A")
    @Published var mainYellow: Color = Color.init(hex: "#F39F5A")
    @Published var foreground: Color = Color.init(hex: "#E8BCB9")
    
    func switchMode(to: Bool) async {
        
    }
    
    func getAll() -> [Color] {
        return [background, mainPurple, mainDarkRed, mainLightRed, mainYellow, foreground]
    }
}
