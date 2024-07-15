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
    @Published var foreground: Color = Color.init(hex: "#000000")
    @Published var background: Color = Color.init(hex: "#EEEEEE")
    
}
