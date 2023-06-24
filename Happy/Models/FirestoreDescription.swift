//
//  FirestoreDescription.swift
//  Happy
//
//  Created by Fatih Yavuz on 20.06.2023.
//

import Foundation

struct FirestoreDescription: Identifiable {
    var id = UUID()
    var name: String
    private enum CodingKeys: String, CodingKey {
           case name
       }
}
extension FirestoreDescription: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
       
    }
}

extension FirestoreDescription: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
   
    }
}
