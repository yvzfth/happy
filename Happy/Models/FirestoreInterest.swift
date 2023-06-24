//
//  FirestoreInterest.swift
//  Happy
//
//  Created by Fatih Yavuz on 20.06.2023.
//

import Foundation

struct FirestoreSubcategory: Identifiable {
    var id = UUID()
    var name: String
    enum CodingKeys: String, CodingKey {
        case name
        
    }
}

extension FirestoreSubcategory: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
      
    }
}

extension FirestoreSubcategory: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
     
        
    }
}


struct FirestoreInterest: Identifiable {
    var id = UUID()
    var name: String
    var subcategories: [FirestoreSubcategory]
    enum CodingKeys: String, CodingKey {
        case name
        case subcategories
        
    }
}

extension FirestoreInterest: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        subcategories = try container.decode([FirestoreSubcategory].self, forKey: .subcategories)
      
    }
}

extension FirestoreInterest: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(subcategories, forKey: .subcategories)
        
    }
}
