//
//  Language.swift
//  Happy
//
//  Created by Fatih Yavuz on 17.07.2023.
//

import Foundation

enum LanguageEnum: String, CaseIterable {
    case english = "English"
    case spanish = "Spanish"
    case french = "French"
    case german = "German"
    case chinese = "Chinese"
    // Add more languages as needed
    
    var displayName: String {
        return self.rawValue
    }
    var flagImage: String {
           switch self {
           case .english:
               return "us_flag"
           case .spanish:
               return "es_flag"
           case .french:
               return "fr_flag"
           case .german:
               return "de_flag"
           case .chinese:
               return "cn_flag"
           // Add more cases for other languages
           }
       }
}

struct Language: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var isNative: Bool = false
    private enum CodingKeys: String, CodingKey {
           case name
        case isNative
       }
}


extension Language: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        isNative = try container.decode(Bool.self, forKey: .isNative)
       
    }
}

extension Language: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container .encode(isNative, forKey: .isNative)
    }
}
