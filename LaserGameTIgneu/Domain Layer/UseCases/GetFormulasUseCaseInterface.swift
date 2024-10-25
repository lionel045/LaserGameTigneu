//
//  GetFormulaUseCaseInterface.swift
//  LaserGameTIgneu
//
//  Created by Lion on 11/08/2024.
//

import Foundation
import Combine

protocol GetFormulasUseCaseInterface {
    func execute() -> AnyPublisher<[Formula], Error>
}
