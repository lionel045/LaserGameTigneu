import Foundation

struct Formula: Identifiable, Codable {
    var id: UUID
    var name: String
    var price: Double
    var numberOfParty: Int
    var imageUrl: String?
    var minPerson: Int
    var maxPerson: Int
    var duration: Int
    var gift: [String]?
    var type: String?
    
    // Fonction pour associer les images aux formules
    static func mapImagesToFormulas(formulas: inout [Formula], images: [FormulaImage]) {
        for (index, formula) in formulas.enumerated() {
            if let image = images.first(where: { $0.imageName?.lowercased() == formula.name.lowercased() }) {
                formulas[index].imageUrl = image.imageUrl?.absoluteString
            }
        }
    }
}
