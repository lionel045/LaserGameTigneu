//
//  ExtensionColor.swift
//  LaserGameTIgneu
//
//  Created by Lion on 24/08/2024.
//

import Foundation
import SwiftUI

extension LinearGradient {
    static var selectedSegmentGradient: LinearGradient {
        return LinearGradient(colors: [.colorSimpleParty2, .colorSimpleParty1.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    static var unselectedSegmentGradient: LinearGradient {
        return LinearGradient(colors: [.black.opacity(0.9), .white.opacity(0.18)], startPoint: .top, endPoint: .bottom)
    }
}
    
    extension View {
        func innerShadow(color: Color, radius: CGFloat = 0.1) -> some View {
            modifier(InnerShadow(color: color, radius: min(max(0, radius), 1)))
        }
    }

    private struct InnerShadow: ViewModifier {
        var color: Color = .gray
        var radius: CGFloat = 0.1

        private var colors: [Color] {
            [color.opacity(0.75), color.opacity(0.0), .clear]
        }

        func body(content: Content) -> some View {
            GeometryReader { geo in
                content
                    .overlay(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .top, endPoint: .bottom)
                        .frame(height: self.radius * self.minSide(geo)),
                             alignment: .top)
                    .overlay(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .bottom, endPoint: .top)
                        .frame(height: self.radius * self.minSide(geo)),
                             alignment: .bottom)
                    .overlay(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .leading, endPoint: .trailing)
                        .frame(width: self.radius * self.minSide(geo)),
                             alignment: .leading)
                    .overlay(LinearGradient(gradient: Gradient(colors: self.colors), startPoint: .trailing, endPoint: .leading)
                        .frame(width: self.radius * self.minSide(geo)),
                             alignment: .trailing)
            }
        }

        func minSide(_ geo: GeometryProxy) -> CGFloat {
            CGFloat(1) * min(geo.size.width, geo.size.height) / 2
        }
    }
