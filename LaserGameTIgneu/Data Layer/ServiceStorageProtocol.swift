//
//  ServiceStorageProtocol.swift
//  LaserGameTIgneu
//
//  Created by Lion on 30/07/2024.
//

import Foundation
import SwiftUI
import Combine
protocol ServiceStorageProtocol {
    
    func fetchAllImage()-> AnyPublisher<[FormulaImage],Error>
    func removeImage(imageName: String)
    
}
