import Foundation
import Combine
import FirebaseFirestore

struct FormulaFirestore: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String?
    var price: Double?
    var numberOfParty: Int?
    var time: String?
    var imageUrl: String?
    var minPers: Int?
    var maxPers: Int?
    var duration: Int?
    var gift: [String]?
    var type: String?
}
