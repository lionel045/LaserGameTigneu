//
//  ServiceFirestoreDbInterface.swift
//  LaserGameTIgneu
//
//  Created by Lion on 05/08/2024.
//

import Foundation
import Combine


protocol ServiceFormulaDbProtocol {
    
    func getAllFormula()-> Future<[FormulaFirestore],Error>
    
    
}
