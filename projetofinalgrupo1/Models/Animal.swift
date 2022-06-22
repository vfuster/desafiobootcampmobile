
import Foundation

struct AnimalResponse: Codable {
    let items: [Animal]
}

struct Animal: Codable {
    let name: String
    let description: String
    let age: Int
    let species: String
    let image: String
}
