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
          .titleFont()
          .foregroundColor(.fontDark)
        
        Text("Body")
          .bodyFont()
          .foregroundColor(.fontLight)
        
        Text("Body Bold")
          .bodyBoldFont()
          .foregroundColor(.fontDark)
        
        Text("System")
          .textFieldFont()
          .foregroundColor(.primaryColor)
        
      }
    }
}

extension View {
  func titleFont() -> some View {
    modifier(CustomFonts.TitleFontStyle())
  }
  
  func bodyFont() -> some View {
    modifier(CustomFonts.BodyFontStyle())
  }
  
  func bodyBoldFont() -> some View {
    modifier(CustomFonts.BodyBoldFontStyle())
  }
  
  func textFieldFont() -> some View {
    modifier(CustomFonts.TextInputFontStyle())
  }
}

enum CustomFonts {
  static let fontName = "Helvetica"
  
  struct TitleFontStyle: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(.custom(fontName, size: 24, relativeTo: .title))
    }
  }
  
  struct BodyFontStyle: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(.custom(fontName, size: 16, relativeTo: .body))
    }
  }
  
  struct BodyBoldFontStyle: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(.custom(fontName, size: 16, relativeTo: .body))
        .fontWeight(.bold)
    }
  }
  
  struct TextInputFontStyle: ViewModifier {
    func body(content: Content) -> some View {
      content
        .font(.system(size: 16))
    }
  }
}

struct FontsStyle_Previews: PreviewProvider {
    static var previews: some View {
        FontsStyle()
    }
}
