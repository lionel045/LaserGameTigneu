//
//  ContentIcon + Label.swift
//  LaserGameTIgneu
//
//  Created by Lion on 27/07/2024.
//

import SwiftUI
struct ContentIconLabel: View {
    var formula: Formula?
    var body: some View {
        VStack(alignment: .leading, spacing: 6){
            if let formula = formula  {
                FormulaIcon(systemName:"euro", label: "\(formula.price.formattedPrice())€")
                FormulaIcon(systemName:"coin", label: "\(formula.numberOfParty) Partie")
                FormulaIcon(systemName:"clock", label: formula.duration < 3 ? "\(formula.duration) Heure" : "\(formula.duration) Minutes")
                FormulaIcon(systemName:"person", label: "Min \(formula.minPerson) pers / \(formula.maxPerson) pers")
                    
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout){
    ContentIconLabel(formula: MockFormulaModel.getMockFormulas()[0])

}

struct FormulaIcon: View {
    var systemName: String?
    var label: String?
    var body: some View {
        HStack(spacing: 6) {
            
            
            Image(systemName ?? "")
                .resizable()
                .frame(width: 16,height: 16)
                
            Text(label ?? "")
                .font(.system(size: 14))
                .foregroundStyle(.white)
        }
    }
}
