//
//  Gender.swift
//  Happy
//
//  Created by Fatih Yavuz on 17.07.2023.
//

import Foundation

enum GenderEnum: String, CaseIterable {
    case male = "Male"
    case female = "Female"
    case other = "Other"
    case nonBinary = "Non-binary"
    case genderqueer = "Genderqueer"
    case transgenderMale = "Transgender male"
    case transgenderFemale = "Transgender female"
    case agender = "Agender"
    case genderfluid = "Genderfluid"
    case twoSpirit = "Two-spirit"
    case bigender = "Bigender"
    case androgynous = "Androgynous"
    
    var displayName: String {
        return self.rawValue
    }
}

struct Gender: Identifiable, Hashable {
    let id = UUID()
    var name: String
    private enum CodingKeys: String, CodingKey {
           case name
       }
}

extension Gender: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
       
    }
}

extension Gender: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
   
    }
}
