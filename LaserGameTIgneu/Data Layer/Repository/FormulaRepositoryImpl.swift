//
//  FormulaRepositoryImpl.swift
//  LaserGameTIgneu
//
//  Created by Lion on 08/08/2024.
//

import Foundation
import Combine

struct FormulaRepositoryImpl: FormulaRepositoryInterface {
    
    
    var imageDataSource: ServiceStorageProtocol
    var formulaDataSource: ServiceFormulaDbProtocol
    
    func getAllFormula() -> AnyPublisher<[Formula], any Error> {
        let formulasPublisher = formulaDataSource.getAllFormula()
            .map { formulas -> [Formula] in
                formulas.map { formula in
                    Formula(
                        id: UUID(uuidString: formula.id ?? "") ?? UUID() ,
                        name: formula.name ?? "",
                        price: formula.price ?? 0,
                        numberOfParty: formula.numberOfParty ?? 0,
                        imageUrl: formula.imageUrl,
                        minPerson: formula.minPers ?? 0,
                        maxPerson: formula.maxPers ?? 0,
                        duration: formula.duration ?? 0,
                        gift: formula.gift,
                        type: formula.type ?? ""
                    )
                }
            }
            .eraseToAnyPublisher()
        
        let imagesPublisher = imageDataSource.fetchAllImage()
        return Publishers.Zip(formulasPublisher, imagesPublisher)
            .map { formulas, images in
                var mutableFormulas = formulas
                Formula.mapImagesToFormulas(formulas: &mutableFormulas, images: images)
                return mutableFormulas
            }
            .eraseToAnyPublisher()
    }
    
    func getImage() -> AnyPublisher<[FormulaImage], any Error> {
        imageDataSource.fetchAllImage()
    }
}
