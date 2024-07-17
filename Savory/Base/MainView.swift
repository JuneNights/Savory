//
//  MainView.swift
//  Savory
//
//  Created by Junior Figuereo on 7/15/24.
//

import SwiftUI
import ActivityIndicatorView

struct MainView: View {
    @StateObject var appColors = AppColors()
    @StateObject var tabsViewHelper = TabsUI()
    @State private var loading: Bool = false
    var body: some View {
        ZStack {
            if tabsViewHelper.appLoading {
                InitialLoadingScreen()
                    .environmentObject(appColors)
            } else {
                TabView(selection: $tabsViewHelper.mainTabSelected) {
                    BrowseMainView()
                        .tag(Tab.browse)
                        .foregroundStyle(appColors.foreground)
                        .background(appColors.background)
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
        .task {
            Task {
                await MainActor.run { tabsViewHelper.appLoading = true }
                try await Task.sleep(seconds: 5)
                await MainActor.run { tabsViewHelper.appLoading = false }
            }
        }
        .overlay(
            VStack {
                ActivityIndicatorView(isVisible: $tabsViewHelper.appLoading, type: .gradient(appColors.getAll(), .round, lineWidth: 5))
            }
        )
    }
}
