//
//  ButtonsStyles.swift
//  MyPlantsLayout
//
//  Created by Isis Silva on 12/10/22.
//

import SwiftUI

struct ButtonsStyles: View {
  var body: some View {
    NavigationView {
      List {
        Text("Tab Buttons")
        HStack(spacing: 32) {
          Button {} label: { IconImage(icon: .basket) }
            .buttonStyle(ButtonStyles.RoundedButtonStyle(itemsCount: 2))
          
          Button {} label: { IconImage(icon: .basket) }
            .buttonStyle(ButtonStyles.RoundedButtonStyle(itemsCount: nil))
          
          Button {} label: { IconImage(icon: .person) }
            .buttonStyle(ButtonStyles.TabBarIconStyle(item: .heart, isSelected: true))
          
          Button {} label: { IconImage(icon: .heart) }
            .buttonStyle(ButtonStyles.TabBarIconStyle(item: .heart, isSelected: false))
        }
        
        Text("Neumorphic Buttons")
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 105))]) {
          Button {} label: { IconImage(icon: .cart) }
            .buttonStyle(ButtonStyles.BorderedButtonStyle())
          
          Button {} label: { IconImage(icon: .basket) }
            .buttonStyle(ButtonStyles.NeumorphicButtonStyle(itemsCount: 2))
          
          Button {} label: { IconImage(icon: .slider) }
            .buttonStyle(ButtonStyles.NeumorphicButtonStyle(itemsCount: nil))
          
          Button {} label: { IconImage(icon: .back) }
            .buttonStyle(ButtonStyles.NeumorphicButtonStyle(itemsCount: nil)).padding(24)
          
          Button {} label: {
            HStack {
              Text("View cart").bodyFont()
              IconImage(icon: .right)
            }
          }
          .buttonStyle(ButtonStyles.NeumorphicButtonStyle(itemsCount: nil))
        }
        .padding()
        
        HStack {
          Text("Plain Button")
          Spacer()
          Button{} label: {
            Text("See all")
          }
          .buttonStyle(ButtonStyles.PlainButtonStyle())
        }
      }
      .navigationTitle("Buttons Style")
    }
  }
}

enum ButtonStyles {
  struct BorderedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
      configuration.label
        .padding()
        .foregroundColor(.neomorphicGradientColor)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .strokeBorder(Color.neomorphicGradientColor, lineWidth: 4)
        )
        .background(Color.primaryLinearGradient).cornerRadius(12)
        .scaleEffect(configuration.isPressed ? 0.8 : 1)
        .neomorphicShadow()
    }
  }
  
  struct NeumorphicButtonStyle: ButtonStyle {
    let itemsCount: Int?
    
    func makeBody(configuration: Configuration) -> some View {
      configuration.label
        .foregroundColor(.fontLight)
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color.linearGradient)
            .neomorphicShadow()
        )
        .foregroundColor(.white)
        .frame(height: 40)
        .overlay {
          if let count = itemsCount, count != 0 {
            ZStack {
              Circle().foregroundColor(.primaryColor).frame(width: 14)
              Text("\(count)").font(.system(size: 10)).fontWeight(.bold)
                .foregroundColor(.neomorphicGradientColor)
            }
            .offset(x: 8, y: 7)
          }
        }
        .scaleEffect(configuration.isPressed ? 0.8 : 1)
    }
  }
  
  struct PlainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
      configuration.label
        .textFieldFont()
        .scaleEffect(configuration.isPressed ? 0.8 : 1)
        .foregroundColor(.primaryColor)
    }
  }
  
  struct RoundedButtonStyle: ButtonStyle {
    let itemsCount: Int?
    
    func makeBody(configuration: Configuration) -> some View {
      configuration.label
        .foregroundColor(.backgroundTheme)
        .padding()
        .background(Circle().foregroundColor(.primaryColor))
        .overlay {
          if let count = itemsCount, count != 0 {
            ZStack {
              Circle().foregroundColor(.white).frame(width: 14)
              Text("\(count)").font(.system(size: 10)).fontWeight(.bold)
                .foregroundColor(.primaryColor)
            }
            .offset(x: 8, y: 7)
          }
        }
        .centralShadow()
        .scaleEffect(configuration.isPressed ? 0.8 : 1)
    }
  }
  
  struct TabBarIconStyle: ButtonStyle {
    let item: TabItems
    let isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
      if item != .basket {
        VStack(spacing: 2) {
          configuration.label
            .foregroundColor(isSelected ? .primaryColor : .iconColor)
          Circle()
            .foregroundColor(isSelected ? .primaryColor : .clear)
            .frame(width: 8)
        }
      }
    }
  }
}

struct ButtonsStyles_Previews: PreviewProvider {
  static var previews: some View {
    ButtonsStyles()
  }
}

