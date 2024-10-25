//
//  StoreImageManager.swift
//  LaserGameTIgneu
//
//  Created by Lion on 28/07/2024.
//

import SwiftUI
import Foundation
import Firebase
import Combine
import FirebaseStorage




class ServiceStorageManager: ServiceStorageProtocol{
    
    private let storage = Storage.storage()

    @Published var imageArray : Set<FormulaImage> = []
    
    
    func fetchAllImage() -> AnyPublisher<[FormulaImage],Error> {
        let ref = storage.reference().child("Formula")
        let subject = PassthroughSubject<[FormulaImage],Error>()
    
        ref.listAll { (result, error) in
            if error != nil {
                print("Can't fetch file")
                return
            }
            guard let items = result?.items else {
                print("No items found")
                subject.send(completion: .failure(NSError(domain: "No items found", code: -1, userInfo: nil)))
                return
            }
            var formulaImagesArray = [FormulaImage]()
            let dispatchGroup = DispatchGroup()
            for item in items {
                dispatchGroup.enter()
                item.downloadURL { url,error in
                    if let error = error {
                        print("Dowload failed \(error.localizedDescription)")
                        dispatchGroup.leave()
                        
                    }
                    else if let url = url {
                        let imageName = item.name.chunkStringAfter(cutAt: ".")
                        print(imageName)
                        let formulaImage = FormulaImage(imageName: imageName, imageUrl: url)
                        formulaImagesArray.append(formulaImage)
                        dispatchGroup.leave()

                    }

                }
            }
            dispatchGroup.notify(queue: .main){
                print("All data are correctly fetched")
                subject.send(formulaImagesArray)
                subject.send(completion: .finished)
            }
        }
        return subject.eraseToAnyPublisher()

    }
    
    func removeImage(imageName: String) {
        let storageRef = storage.reference().child("Formula/\(imageName).jpg")
        storageRef.delete { [weak self] error in
            if let error = error {
                print("Error deleting image: \(error)")
                return
            }
            DispatchQueue.main.async {
                if let formulaImage = self?.imageArray.first(where: { $0.imageName == imageName }) {
                    self?.imageArray.remove(formulaImage)
                }            }
        }
    }
}


