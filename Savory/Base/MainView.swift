//
//  MainView.swift
//  Savory
//
//  Created by Junior Figuereo on 7/15/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var appColors = AppColors()
    @StateObject var tabsViewHelper = TabsUI()
    @State private var loading: Bool = false
    var body: some View {
        if loading {
            
        } else {
            ZStack {
                TabView(selection: $tabsViewHelper.mainTabSelected) {
                    BrowseMainView()
                        .tag(Tab.browse)
                    CartMainView()
                        .tag(Tab.cart)
                    SettingsMainView()
                        .tag(Tab.settings)
                    ProfileMainView()
                        .tag(Tab.profile)
                }
                .environmentObject(tabsViewHelper)
                .environmentObject(appColors)
                .opacity(tabsViewHelper.popupIsActive ? 0.5 : 1)
                
                VStack {
                    Spacer()
                    CustomTabBar(selectedTab: $tabsViewHelper.mainTabSelected)
                        .environmentObject(appColors)
                }
                
            }
        }
    }
}
