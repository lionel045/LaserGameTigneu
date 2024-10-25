//
//  FormulaEntity.swift
//  LaserGameTIgneu
//
//  Created by Lion on 26/07/2024.
//

import Foundation



struct FormulaImage: Hashable {
    var imageName: String?
    var imageUrl: URL?
}

extension String {
    func chunkStringAfter(cutAt: Character) -> String{
        
        guard let index = self.firstIndex(of: cutAt) else {
            return self
        }
        let chuckIndex = self.index(before: index)
        let chunck = self[...chuckIndex]
        
        return String(chunck)
    }
}
