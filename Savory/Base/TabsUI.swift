//
//  TabsUI.swift
//  Savory
//
//  Created by Junior Figuereo on 7/15/24.
//

import Foundation
import SwiftUI

class TabsUI: ObservableObject {
    @Published var mainTabSelected: Tab = .browse
    @Published var popupIsActive: Bool = false
}
