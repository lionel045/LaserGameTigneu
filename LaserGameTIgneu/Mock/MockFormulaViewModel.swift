//
//  MockFormulaViewModel.swift
//  LaserGameTIgneu
//
//  Created by Lion on 20/08/2024.
//
import SwiftUI
import Combine
import Foundation
// Classe mock du ViewModel pour les tests et les prévisualisations
class MockFormulaViewModel: FormulaViewModel {
    
    
    // Initialisation du MockFormulaViewModel avec des données factices
    init() {
        // Appel du super init avec un mock use case si nécessaire
        super.init(formulaUseCase: MockGetFormulasUseCase())
        
        // Injection de données factices dans la liste des formules
        self.formulaList = [
            Formula(id: UUID(),name: "Evg", price: 30, numberOfParty: 2, imageUrl: "https://firebasestorage.googleapis.com/v0/b/lasergametigneu.appspot.com/o/Formula%2FEvjg.jpg?alt=media&token=8733bee8-1e26-4619-a32a-2476021fdf75", minPerson: 5, maxPerson: 15, duration: 2, gift: ["Apero", "Biere", "Boisson"], type: "Evenementiel"),
            Formula(id: UUID() ,name: "Simple", price: 9, numberOfParty: 1, imageUrl: "https://firebasestorage.googleapis.com/v0/b/lasergametigneu.appspot.com/o/Formula%2FSimple.jpg?alt=media&token=373ae6b7-c286-457e-b38a-30fca7c52336", minPerson: 10, maxPerson: 20, duration: 20, gift: ["Trophy"], type: "Simple"),
            Formula(id: UUID() ,name: "Birthday", price: 15, numberOfParty: 2, imageUrl: "https://firebasestorage.googleapis.com/v0/b/lasergametigneu.appspot.com/o/Formula%2FBirthday.jpg?alt=media&token=79651761-ed04-4983-b21a-156d0cf7e5ef", minPerson: 2, maxPerson: 8, duration: 2, gift: nil, type: "Evenementiel")
        ]
    }
    
    
}

class MockGetFormulasUseCase: GetFormulasUseCaseInterface {
    func execute() -> AnyPublisher<[Formula], Error> {
        let mockFormulas = [
            Formula(id: UUID(),name: "Evg", price: 30, numberOfParty: 2, imageUrl: "https://firebasestorage.googleapis.com/v0/b/lasergametigneu.appspot.com/o/Formula%2FEvjg.jpg?alt=media&token=8733bee8-1e26-4619-a32a-2476021fdf75", minPerson: 5, maxPerson: 15, duration: 2, gift: ["Apero", "Biere", "Boisson"], type: "Evenementiel"),
            Formula(id:UUID() ,name: "Simple", price: 9, numberOfParty: 1, imageUrl: "https://firebasestorage.googleapis.com/v0/b/lasergametigneu.appspot.com/o/Formula%2FSimple.jpg?alt=media&token=373ae6b7-c286-457e-b38a-30fca7c52336", minPerson: 10, maxPerson: 20, duration: 20, gift: ["Trophy"], type: "Simple"),
            Formula(id: UUID(),name: "Birthday", price: 15, numberOfParty: 2, imageUrl: "https://firebasestorage.googleapis.com/v0/b/lasergametigneu.appspot.com/o/Formula%2FBirthday.jpg?alt=media&token=79651761-ed04-4983-b21a-156d0cf7e5ef", minPerson: 2, maxPerson: 8, duration: 2, gift: nil, type: "Simple")
        ]
        return Just(mockFormulas)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

