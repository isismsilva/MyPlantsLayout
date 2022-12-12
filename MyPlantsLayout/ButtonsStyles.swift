//
//  ButtonsStyles.swift
//  MyPlantsLayout
//
//  Created by Isis Silva on 12/10/22.
//

import SwiftUI

struct ButtonsStyles: View {
  var body: some View {
    VStack(spacing: 30) {
      Button {} label: {
        Image(systemName: "cart")
      }
      .buttonStyle(ButtonStyles.borderedButton())
      
      Button {} label: {
        Image(systemName: "car")
          .foregroundColor(.gray)
      }
      .buttonStyle(ButtonStyles.iconButton(itemsCount: 2))
      
      Button {} label: {
        Image(systemName: "car")
          .foregroundColor(.gray)
      }
      .buttonStyle(ButtonStyles.iconButton())
      
      Button {} label: {
        Text("Normal")
      }
      .buttonStyle(ButtonStyles.normalTextButton())
      
      Button {} label: {
        Image(systemName: "car")
          .foregroundColor(.white)
      }
      .roundedItem(itemsCount: 2)
      
      Button {} label: {
        IconImage(icon: .heart)
      }.tabIcon(item: .heart, isSelected: true)
    }
  }
}

extension View {
  func roundedItem(itemsCount: Int?) -> some View {
    modifier(ButtonTypes.RoundedItem(itemsCount: itemsCount))
  }
  
  func tabIcon(item: TabItems, isSelected: Bool) -> some View {
    modifier(ButtonTypes.TabBarIcon(item: item, isSelected: isSelected))
  }
}


enum ButtonTypes {
  struct RoundedItem: ViewModifier {
    let itemsCount: Int?
    
    init(itemsCount: Int? = nil) {
      self.itemsCount = itemsCount
    }
    
    func body(content: Content) -> some View {
      content
        .padding()
        .background(Circle())
        .foregroundColor(.primaryColor)
        .frame(width: 40, height: 40)
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
    }
  }
  
  struct TabBarIcon: ViewModifier {
    let item: TabItems
    let isSelected: Bool
    
    func body(content: Content) -> some View {
      if item != .basket {
        if isSelected && item != .basket {
          VStack {
            Circle()
              .frame(width: 8)
            Text(item.icon.name)
              .font(.system(size: 8))
              .frame(width: 20)
          }
          .foregroundColor(.primaryColor)
        } else {
          content.foregroundColor(Color.iconColor)
        }
      }
    }
  }
}


enum ButtonStyles {
  struct borderedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
      configuration.label
        .padding()
        .foregroundColor(.white)
        .background(RoundedRectangle(cornerRadius: 10)
          .strokeBorder(.white, lineWidth: 4))
        .background(Color.primaryColor).cornerRadius(10)
        .frame(width: 62, height: 64)
        .scaleEffect(configuration.isPressed ? 0.8 : 1)
        .shadow(radius: 10)
    }
  }
  
  struct iconButton: ButtonStyle {
    let itemsCount: Int?
    
    init(itemsCount: Int? = nil) {
      self.itemsCount = itemsCount
    }
    
    func makeBody(configuration: Configuration) -> some View {
      configuration.label
        .padding()
        .foregroundColor(.white)
        .background(RoundedRectangle(cornerRadius: 12))
        .foregroundColor(.white)
        .frame(width: 40, height: 40)
        .overlay {
          if let count = itemsCount, count != 0 {
            ZStack {
              Circle().foregroundColor(.primaryColor).frame(width: 14)
              Text("\(count)").font(.system(size: 10)).fontWeight(.bold)
            }
            .offset(x: 8, y: 7)
          }
        }
        .scaleEffect(configuration.isPressed ? 0.8 : 1)
        .shadow(color: .fontLight, radius: 3, x: 2, y: 2)
    }
  }
  
  struct normalTextButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
      configuration.label
        .textFieldFont()
        .scaleEffect(configuration.isPressed ? 0.8 : 1)
    }
  }
}

struct ButtonsStyles_Previews: PreviewProvider {
  static var previews: some View {
    ButtonsStyles()
  }
}

