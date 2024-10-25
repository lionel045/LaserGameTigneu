//
//  fetchFormUseCase.swift
//  LaserGameTIgneu
//
//  Created by Lion on 22/07/2024.
//

import Foundation
import Combine

class GetFormulaUseCase : GetFormulasUseCaseInterface {
 
    var repo: FormulaRepositoryInterface
    
    init(repo: FormulaRepositoryInterface) {
        self.repo = repo
    }
    
    func execute() -> AnyPublisher<[Formula],Error>
    {
        return repo.getAllFormula()
    }
}
