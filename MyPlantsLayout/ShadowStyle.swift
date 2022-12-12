//
//  ShadowStyle.swift
//  MyPlantsLayout
//
//  Created by Isis Silva on 12/11/22.
//

import SwiftUI

struct ShadowStyle: View {
  var body: some View {
    let shape = RoundedRectangle(cornerRadius: 20).frame(width: 100, height: 100)
    
    NavigationView {
      List {
        Text("Neomorphic Shadow")
        HStack(spacing: 32) {
          shape
            .foregroundColor(.backgroundTheme)
            .neomorphicShadow()
          
        }
        Text("Central Shadow")
        HStack(spacing: 32) {
          shape
            .foregroundColor(.backgroundTheme)
            .centralShadow()
        }
      }
      .navigationTitle("Shadow Catalog")
    }
  }
}

extension View {
  func neomorphicShadow() -> some View {
    modifier(CustomShadows.NeomorphicShadow())
  }
  
  func innerShadow() -> some View {
    modifier(CustomShadows.InnerShadow())
  }
  
  func centralShadow() -> some View {
    modifier(CustomShadows.CentralShadow())
  }
}

enum CustomShadows {
  
  struct NeomorphicShadow: ViewModifier {
    func body(content: Content) -> some View {
      content
        .shadow(color: .neomorphicShadowLight, radius: 10, x: -2, y: -2)
        .shadow(color: .neomorphicShadowDark, radius: 10, x: 2, y: 2)
    }
  }
  
  struct InnerShadow: ViewModifier {
    func body(content: Content) -> some View {
      content.background(
        .shadow(.inner(color: .ineerShadowAlpha, radius: 10, x: -2, y: -2))
        .shadow(.inner(color: .ineerShadow, radius: 10, x: 2, y: 2))
      )
    }
  }
  
  struct CentralShadow: ViewModifier {
    func body(content: Content) -> some View {
      content
        .shadow(color: .neomorphicShadowDark, radius: 10, x: 0, y: 2)
    }
  }
}

struct ShadowStyle_Previews: PreviewProvider {
  static var previews: some View {
    ShadowStyle()
  }
}
