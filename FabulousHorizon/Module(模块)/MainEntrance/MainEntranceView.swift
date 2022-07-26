//
//  MainEntranceView.swift
//  FabulousHorizon
//
//  Created by 刘超正 on 2022/7/24.
//

import SwiftUI

struct MainEntranceView: BaseView {
    
    @State var selectedIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            HomeView().tabItem {
                Image("icon_tabBar_home")
                Text("321312ggg")
            }
        }
    }
}

struct MainEntranceView_Previews: PreviewProvider {
    static var previews: some View {
        MainEntranceView()
    }
}
