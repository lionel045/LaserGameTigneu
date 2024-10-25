//
//  SwiftUIView.swift
//  LaserGameTIgneu
//
//  Created by Lion on 27/07/2024.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack{
            Color.black.ignoresSafeArea().overlay {
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(.white)
            }
        }

    }
}

#Preview {
    SwiftUIView()
}
