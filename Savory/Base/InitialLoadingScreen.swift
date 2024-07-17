//
//  InitialLoadingScreen.swift
//  Savory
//
//  Created by Junior Figuereo on 7/17/24.
//

import SwiftUI

struct InitialLoadingScreen: View {
    @EnvironmentObject var appColors: AppColors
    var body: some View {
        VStack {
            Spacer()
            Text("Savory")
                .font(.custom(Font.greatVibes, size: 65))
                .foregroundStyle(appColors.foreground)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: appColors.getAll()), startPoint: .top, endPoint: .bottom))
    }
}
