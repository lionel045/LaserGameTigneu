//
//  SegmentedControl.swift
//  LaserGameTIgneu
//
//  Created by Lion on 28/07/2024.
//

import SwiftUI

struct SegmentedControlView: View {
    var formula: [Formula]
    @State private var selectedState: SegmentedState = .simple
    var width: CGFloat
    
    var body: some View {
        VStack {
            HStack {
                ForEach(SegmentedState.allCases, id: \.rawValue) { state in
                    Button(action: {
                        selectedState = state
                    }) {
                        Text(state.rawValue)
                            .frame(width: width, height: 15)
                            .padding()
                            .foregroundColor(.white)
                            .background {
                                ZStack {
                                    if selectedState != state {
                                        selectedState.unselected
                                    } else {
                                        selectedState.selected
                                    }
                                }
                                .cornerRadius(9)
                            }
                    }
                }
            }
            
            .padding(.bottom, 10)
            
            FormulaListView(formulas: filteredFormulas)

        }
        
    }
    
    private var filteredFormulas: [Formula] {
        return formula.filter { $0.type?.lowercased() == selectedState.rawValue.lowercased() }
    }
}

#Preview {
    SegmentedControlView(formula: MockFormulaModel.getMockFormulas(), width: 200)
}
