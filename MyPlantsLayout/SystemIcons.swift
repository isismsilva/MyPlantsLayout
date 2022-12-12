//
//  SystemIcons.swift
//  MyPlantsLayout
//
//  Created by Isis Silva on 12/11/22.
//

import SwiftUI

struct SystemIcons: View {
  var body: some View {
    
    NavigationView {
      List {
        ForEach(IconImage.Icons.allCases, id: \.self) { image in
          HStack(spacing: 42) {
            IconImage(icon: image)
            Text(image.name)
              .bodyFont()
          }
        }
      }
      .navigationTitle("Iconography")
    }
  }
}

struct IconImage: View {
  let icon: Icons
  
  var body: some View {
    Image(systemName: icon.rawValue)
      .frame(width: 20, height: 20)
      .aspectRatio(contentMode: .fit)
  }
  
  enum Icons: String, CaseIterable {
    case heart = "heart.fill"
    case house = "house.fill"
    case person = "person.fill"
    case plants = "leaf.fill"
    case back = "chevron.backward"
    case right = "chevron.right"
    case slider = "slider.vertical.3"
    case basket = "basket"
    case cart = "cart"
    case plus = "plus"
    case minus = "minus"
    
    var name: String {
      switch self {
      case .heart: return "heart"
      case .house: return "house"
      case .person: return "person"
      case .plants: return "plants"
      case .back: return "back"
      case .right: return "right"
      case .slider: return "slider"
      case .basket: return "basket"
      case .cart: return "cart"
      case .plus: return "plus"
      case .minus: return "minus"
      }
    }
  }
}

struct SystemIcons_Previews: PreviewProvider {
  static var previews: some View {
    SystemIcons()
  }
}
