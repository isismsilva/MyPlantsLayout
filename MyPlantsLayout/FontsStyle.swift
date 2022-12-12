//
//  FontsStyle.swift
//  MyPlantsLayout
//
//  Created by Isis Silva on 12/10/22.
//

import SwiftUI

struct FontsStyle: View {
    var body: some View {
      VStack(spacing: 20) {
        Text("Title")
          .customFont(.titleFontStyle)
        
        Text("Body")
          .customFont(.bodyFontStyle)
          .foregroundColor(.fontLight)
        
        Text("Body Bold")
          .customFont(.bodyBoldFontStyle)
          .foregroundColor(.fontDark)
        
        Text("System")
          .customFont(.textInputFontStyle)
          .foregroundColor(.primaryColor)
      }
    }
}

extension View {
  func customFont(_ font: CustomFonts) -> some View {
    modifier(CustomFont(font: font))
  }
}

struct CustomFont: ViewModifier {
  let font: CustomFonts
  func body(content: Content) -> some View {
    content.font(font.type)
  }
}

enum CustomFonts {
  static let fontName = "Helvetica"
  
  case titleFontStyle
  case bodyFontStyle
  case bodyBoldFontStyle
  case textInputFontStyle
  
  var type: Font {
    switch self {
    case .titleFontStyle:
      return Font.custom(CustomFonts.fontName, size: 24, relativeTo: .title)
    case .bodyFontStyle:
      return Font.custom(CustomFonts.fontName, size: 16, relativeTo: .body)
    case .bodyBoldFontStyle:
      return Font.custom(CustomFonts.fontName, size: 16, relativeTo: .body)
    case .textInputFontStyle:
      return Font.system(size: 16)
    }
  }
}

struct FontsStyle_Previews: PreviewProvider {
    static var previews: some View {
        FontsStyle()
    }
}
