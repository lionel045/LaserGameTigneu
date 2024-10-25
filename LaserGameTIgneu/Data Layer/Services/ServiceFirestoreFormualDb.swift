//
//  ServiceStorage.swift
//  LaserGameTIgneu
//
//  Created by Lion on 30/07/2024.
//

import Foundation
import Combine
import Firebase

class ServiceFirestoreFormulaDb: ServiceFormulaDbProtocol  {
    let db = Firestore.firestore()
    func getAllFormula() -> Future<[FormulaFirestore], any Error> {
        return Future { promise in
            let documentRef = self.db.collection("Formula")
            documentRef.getDocuments { snap, error in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                let items = snap?.documents.compactMap { doc in
                    try? doc.data(as: FormulaFirestore.self)
                } ?? []
                promise(.success(items))
            }
        }
    }
}
