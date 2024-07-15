//
//  CustomTabBar.swift
//  Savory
//
//  Created by Junior Figuereo on 7/15/24.
//

import SwiftUI

enum Tab: Int, Identifiable, CaseIterable, Comparable {
    static func < (lhs: Tab, rhs: Tab) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case browse, cart, settings, profile
    
    internal var id: Int { rawValue }
    
    var icon: String {
        switch self {
        case .browse:
            return "mail.and.text.magnifyingglass"
        case .cart:
            return "cart.fill"
        case .settings:
            return "gear.circle.fill"
        case .profile:
            return "person.crop.circle.fill"
        }
    }
    
    var title: String {
        switch self {
        case .browse:
            return "Browse"
        case .cart:
            return "Cart"
        case .settings:
            return "Settings"
        case .profile:
            return "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .browse:
            return Color.black
        case .cart:
            return Color.black
        case .settings:
            return Color.black
        case .profile:
            return Color.black
        }
    }
}

struct CustomTabBar: View {
    @EnvironmentObject var appColors: AppColors
    @Binding var selectedTab: Tab
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Divider()
                    .frame(height: 2)
                    .background(appColors.single(.third))
                TabsLayoutView(selectedTab: $selectedTab)
                    .frame(height: 56, alignment: .center)
                    .padding(.horizontal, 30)
            }
        }
        .frame(height: 56, alignment: .center)
        
        .background(appColors.single(.last))
    }
    
    @ViewBuilder private var backgroundView: some View {
        LinearGradient(colors: [.init(white: 0.9), .white], startPoint: .top, endPoint: .bottom)
            .mask {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .stroke(lineWidth: 6)
            }
            .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 8)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
    }
}


fileprivate struct TabsLayoutView: View {
    @EnvironmentObject var appColors: AppColors
    @Binding var selectedTab: Tab
    @Namespace var namespace
    
    var body: some View {
        HStack {
            Spacer(minLength: 0)
            
            ForEach(Tab.allCases) { tab in
                VStack {
                    TabButton(tab: tab, selectedTab: $selectedTab, namespace: namespace)
                        .frame(width: 25, height: 25, alignment: .center)
                    Text(tab.title)
                }
                
                Spacer(minLength: 0)
            }
        }
    }
    
    private struct TabButton: View {
        @EnvironmentObject var appColors: AppColors
        let tab: Tab
        @Binding var selectedTab: Tab
        var namespace: Namespace.ID
        
        var body: some View {
            Button {
                selectedTab = tab
            } label: {
                ZStack {
                    Image(systemName: tab.icon)
                        .resizable()
                        .font(.system(size: 25, weight: .semibold, design: .rounded))
                        .foregroundStyle(isSelected ? appColors.single(.first) : appColors.single(.second))
                }
            }
        }
        private var isSelected: Bool {
            selectedTab == tab
        }
    }
}

