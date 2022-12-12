//
//  CustomTabBar.swift
//  MyPlantsLayout
//
//  Created by Isis Silva on 12/10/22.
//

import SwiftUI

struct CustomTabBar<Content: View>: View {
  @State var selectedItem: TabItems = .home
  @ViewBuilder let content: (TabItems) -> Content
  
  var body: some View  {
    ZStack {
        content(selectedItem)
      VStack {
        Spacer()
        HStack {
          ForEach(TabItems.allCases, id: \.icon) { item in
            Spacer()
            tabBarItem(item: item, isSelected: selectedItem == item)
            Spacer()
          }
        }
        .padding()
        .background(
          TabBarShape(tabHeight: 0)
            .centralShadow()
            .foregroundColor(.backgroundTheme)
        )
        
      }
    }
  }
  
  @ViewBuilder
  func tabBarItem(item: TabItems, isSelected: Bool) -> some View {
    Button { selectedItem = item } label: {
      IconImage(icon: item.icon)
    }
    .tabBarItem(item: item, isSelected: isSelected)
  }
}

struct ToolBarStyle_Previews: PreviewProvider {
  static var previews: some View {
    CustomTabBar(selectedItem: .heart) { _ in}
      .ignoresSafeArea()
  }
}

enum TabItems: CaseIterable {
  case home, plants, basket, heart, person
  
  var icon: IconImage.Icons {
    switch self {
    case .home:
      return IconImage.Icons.house
    case .plants:
      return IconImage.Icons.plants
    case .basket:
      return IconImage.Icons.basket
    case .heart:
      return IconImage.Icons.heart
    case .person:
      return IconImage.Icons.person
    }
  }
}
