//
//  FormulaViewModel.swift
//  LaserGameTIgneu
//
//  Created by Lion on 18/08/2024.
//

import Foundation
import Combine
import SwiftUI

class FormulaViewModel : ObservableObject {
    
    @Published var formulaList : [Formula] = []
    private let formulaUseCase: GetFormulasUseCaseInterface!
    
    private var cancellable = Set<AnyCancellable>()
    
    init(formulaUseCase: GetFormulasUseCaseInterface ) {
        self.formulaUseCase = formulaUseCase
    }
    
    func fetchFormulaUseCase(){
        
        formulaUseCase.execute()
            .receive(on: RunLoop.main)
            .sink (receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Succes")
                case .failure(let error):
                    print("Error de decodage : \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] formula in
                self?.formulaList = formula
            
            })
            .store(in: &cancellable)
            }
}
