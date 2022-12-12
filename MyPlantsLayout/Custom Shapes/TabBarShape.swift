//
//  TabBarShape.swift
//  MyPlantsLayout
//
//  Created by Isis Silva on 12/11/22.
//

import SwiftUI

struct TabBarShape: Shape {
  let tabHeight: Double

  func path(in rect: CGRect) -> Path {
    var path = Path()
    
    let radius: Double = 32
    let lengh: Double = Double(rect.maxX/2 - (radius*3))
    
    let origen = CGPoint(x: rect.minX, y: rect.maxY)
    let arcCenterY = origen.y - radius - tabHeight
    
    let arcCenter1 = CGPoint(
      x: origen.x + radius,
      y: arcCenterY
    )
    
    let arcCenter2 = CGPoint(
      x: origen.x + radius + lengh,
      y: arcCenterY
    )
    
    let arcCenter3 = CGPoint(
      x: origen.x + radius*3 + lengh,
      y: arcCenterY - 10
    )
    
    let arcCenter4 = CGPoint(
      x: origen.x + radius*5 + lengh,
      y: arcCenterY
    )
    
    let arcCenter5 = CGPoint(
      x: origen.x + radius*5 + lengh*2,
      y: arcCenterY
    )
    
    path.move(to: origen)
    path.addLine(to: CGPoint(x: origen.x, y: origen.y - lengh))
    
    path.addArc(
      center: arcCenter1,
      radius: radius,
      startAngle: .degrees(180),
      endAngle: .degrees(-90),
      clockwise: false
    )
    
    path.addLine(to: CGPoint(x: origen.x + radius + lengh, y: arcCenterY - radius))
    
    path.addArc(
      center: arcCenter2,
      radius: radius,
      startAngle: .degrees(-180),
      endAngle: .degrees(0),
      clockwise: false
    )
    
    path.addArc(
      center: arcCenter3,
      radius: radius,
      startAngle: .degrees(180),
      endAngle: .degrees(0),
      clockwise: true
    )
    
    path.addArc(
      center: arcCenter4,
      radius: radius,
      startAngle: .degrees(180),
      endAngle: .degrees(-90),
      clockwise: false
    )
    
    path.addLine(to: CGPoint(x: origen.x + radius*5 + lengh*2, y: arcCenterY - radius))
    
    path.addArc(
      center: arcCenter5,
      radius: radius,
      startAngle: .degrees(-180),
      endAngle: .degrees(0),
      clockwise: false
    )
    
    path.addLine(to: CGPoint(x: origen.x + arcCenter5.x + radius, y: origen.y))
    
    return path
  }
}

struct ToolBarShape_Previews: PreviewProvider {
  static var previews: some View {
    TabBarShape(tabHeight: 40)
      .foregroundColor(.pink)
      .ignoresSafeArea()
  }
}
