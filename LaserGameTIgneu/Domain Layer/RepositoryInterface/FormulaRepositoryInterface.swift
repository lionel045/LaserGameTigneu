//
//  FormulaRepository.swift
//  LaserGameTIgneu
//
//  Created by Lion on 25/07/2024.
//

import Foundation
import Combine
protocol FormulaRepositoryInterface {
    
    func getAllFormula() -> AnyPublisher<[Formula],Error>
    func getImage() -> AnyPublisher<[FormulaImage],Error>
    
}
