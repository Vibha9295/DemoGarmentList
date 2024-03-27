// Garment.swift

import Foundation

struct Garment: Identifiable, Codable {
    var id = UUID()
    var name: String
    var creationDate: Date
}
