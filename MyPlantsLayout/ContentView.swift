//
//  ContentView.swift
//  MyPlantsLayout
//
//  Created by Isis Silva on 12/10/22.
//

import SwiftUI

struct ContentView: View {
  @State var selectedTab: TabItems = .home
  
  var body: some View {
    VStack {
      CustomTabBar { item in
        getTabView(type: item)
      }
    }
    .ignoresSafeArea(edges: .bottom)
  }
  
  @ViewBuilder
    func getTabView(type: TabItems) -> some View {
        switch type {
        case .home:
            ColorStaly()
        case .plants:
          ShadowStyle()
        case .basket:
          FontsStyle()
        case .heart:
          ColorStaly()
        case .person:
          SystemIcons()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
