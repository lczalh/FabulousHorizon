//
//  HomeView.swift
//  FabulousHorizon
//
//  Created by 刘超正 on 2022/7/24.
//

import SwiftUI

struct HomeView: BaseView {
    var body: some View {
        NavigationView {
            VStack {
                BannerView(currentIndex: 0, dragOffset: 0)
                Text("Swifter Swifter")
                    .bold()
                    .foregroundColor(.orange)
                    .font(.largeTitle)
            }.navigationBarTitle(Text("首页"))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
