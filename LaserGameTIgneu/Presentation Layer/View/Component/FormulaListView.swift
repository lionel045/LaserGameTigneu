//
//  FormulaList.swift
//  LaserGameTIgneu
//
//  Created by Lion on 26/07/2024.
//

import SwiftUI

struct FormulaListView: View {
    var formulas: [Formula]
    let columns = Array(repeating: GridItem(.flexible()), count: 1)
    var body: some View {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10){
                    ForEach(formulas, id: \.id) { formula in
                        
                        FormulaRow(formula: formula)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 10)
                    }
                }
        }
    }
}

#Preview {
    FormulaListView(formulas: MockFormulaModel.getMockFormulas())
}
