//
//  MainView.swift
//  Savory
//
//  Created by Junior Figuereo on 7/15/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var appColors = AppColors()
//    @StateObject var tabsUI = TabsUI()
    var body: some View {
        ZStack {
            TabView(selection: $tabsViewHelper.mainTabSelected) {
                FoldersMainView()
                    .tag(Tab.folders)
                    .hiddenNavigationBarStyle()
                    .background(appColors.single(.last))
                    .foregroundStyle(appColors.single(.first))
                BrowserMainView()
                    .tag(Tab.browser)
                    .hiddenNavigationBarStyle()
                DownloadsMainView()
                    .tag(Tab.downloads)
                    .hiddenNavigationBarStyle()
                SettingsMainView()
                    .tag(Tab.settings)
                    .hiddenNavigationBarStyle()
            }
            .environmentObject(tabsViewHelper)
            .environmentObject(appColors)
            .environmentObject(filesVM)
            .opacity(tabsViewHelper.popupIsActive() ? 0.5 : 1)
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $tabsViewHelper.mainTabSelected)
                    .environmentObject(appColors)
            }
            
        }
    }
}
