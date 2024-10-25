//
//  SegmentedState.swift
//  LaserGameTIgneu
//
//  Created by Lion on 24/08/2024.
//

import Foundation
import SwiftUI

enum SegmentedState: String, CaseIterable {
    case event = "Evenementiel"
    case simple = "Simple"
    
    var selected: LinearGradient {
        return LinearGradient(colors: [.colorSimpleParty2, .colorSimpleParty1.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    var unselected: LinearGradient {
        return LinearGradient(colors: [.black.opacity(0.9), .white.opacity(0.18)], startPoint: .top, endPoint: .bottom)
    }
}
