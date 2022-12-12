//
//  ColorStaly.swift
//  MyPlantsLayout
//
//  Created by Isis Silva on 12/11/22.
//

import SwiftUI

struct ColorStaly: View {
  var body: some View {
    let shape = RoundedRectangle(cornerRadius: 20).frame(width: 100, height: 100)
    
    NavigationView {
      List {
        Text("Solid Colors")
        HStack(spacing: 32) {
          shape.foregroundColor(.primaryColor)
          shape.foregroundColor(.backgroundTheme)
            .shadow(radius: 0.8)
        }
        
        Text("Gradient Colors")
        HStack(spacing: 32) {
          RoundedRectangle(cornerRadius: 20)
            .fill(Color.linearGradient).frame(width: 100, height: 100)
          
          RoundedRectangle(cornerRadius: 20)
            .fill(Color.primaryLinearGradient).frame(width: 100, height: 100)
        }
        
        Text("Font Colors")
        HStack(spacing: 32) {
          shape.foregroundColor(.fontDark)
          shape.foregroundColor(.fontLight)
        }
        
        Text("Incon Colors")
        HStack(spacing: 32) {
          shape.foregroundColor(.iconColor)
        }
      }
      .navigationTitle("Color Catalog")
    }
  }
}

extension Color {
  static let primaryColor = Color("PrimaryColor")
  static let backgroundTheme = Color("BackgroundTheme")
  
  static let neomorphicGradient = Color("NeomorphicGradient")
  static let neomorphicGradientColor = Color("NeomorphicGradientColor")
  
  static let neomorphicShadowDark = Color("NeomorphicShadowDark")
  static let neomorphicShadowLight = Color("NeomorphicShadowLight")
  
  static let fontDark = Color("FontDark")
  static let fontLight = Color("FontLight")
  
  static let ineerShadow = Color("InnerNeomorphicShadowLight")
  static let ineerShadowAlpha = Color("InnerNeomorphicShadowLightAlpha")
  
  static let primaryGradientLight = Color("PrimaryGradientLight")
  static let primaryGradientDark = Color("PrimaryGradientDark")
  
  static let iconColor = Color("Icons")
  
  static let linearGradient = LinearGradient(
    colors: [.neomorphicGradient, .neomorphicGradientColor],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
  )
  
  static let primaryLinearGradient = LinearGradient(
    colors: [.primaryGradientLight, .primaryGradientDark],
    startPoint: .topLeading,
    endPoint: .bottomTrailing
  )
}


struct ColorStaly_Previews: PreviewProvider {
  static var previews: some View {
    ColorStaly()
  }
}
