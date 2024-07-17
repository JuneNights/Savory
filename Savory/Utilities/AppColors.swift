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
    @Published var backgroundDark: Color = Color.init(hex: "#1D1A39")
    @Published var backgroundPurple: Color = Color.init(hex: "#451952")
    @Published var backgroundRed: Color = Color.init(hex: "#662549")
    @Published var foregroundRed: Color = Color.init(hex: "#AE445A")
    @Published var foregroundYellow: Color = Color.init(hex: "#F39F5A")
    @Published var foregroundLight: Color = Color.init(hex: "#E8BCB9")
    
    
    func switchMode(to: Bool) async {
        
    }
}
