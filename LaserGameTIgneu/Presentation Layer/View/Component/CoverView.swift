//
//  CoverView.swift
//  LaserGame
//
//  Created by Lion on 09/09/2024.
//

import SwiftUI

struct CoverView: View {
    var width: CGFloat
    var body: some View {
        Rectangle()
            .stroke(.white.opacity(0.7), lineWidth:22)
            .cornerRadius(11)
        
            .blur(radius: 27)
            .frame(width: width , height: 195)
            .overlay {
                TabView {
                    Image("CoverTabView")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(30)
                        .frame(width: width, height: 195)
                }
            }
        
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
    }
}

