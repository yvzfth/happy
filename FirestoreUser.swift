//
//  FirestoreUser.swift
//  Happy
//
//  Created by Fatih Yavuz on 20.06.2023.
//

import Foundation
import FirebaseFirestoreSwift
struct FirestoreUser{
    @DocumentID var id: String?
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var gender: Gender
    var interests: [FirestoreInterest]
    var places: [FirestorePlace]
    var descriptions: [FirestoreDescription]
    var bio: String = ""
    var images: [URL?] 
    var height: Double
    var weight: Double
    var birthday : Date
    var nationality : String
    var interestedGender : Gender
    var languages : [Language]
    private enum CodingKeys: String, CodingKey {
           case id
           case firstName
           case lastName
           case email
           case password
           case gender
           case interests
           case places
           case descriptions
           case bio
           case images
           case height
           case weight
           case birthday
           case nationality
        case interestedGender
        case languages
       }
}

extension FirestoreUser: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        email = try container.decode(String.self, forKey: .email)
        password = try container.decode(String.self, forKey: .password)
        gender = try container.decode(Gender.self, forKey: .gender)
        interests = try container.decode([FirestoreInterest].self, forKey: .interests)
        places = try container.decode([FirestorePlace].self, forKey: .places)
        descriptions = try container.decode([FirestoreDescription].self, forKey: .descriptions)
        bio = try container.decode(String.self, forKey: .bio)
        images = try container.decode([URL].self, forKey: .images)
        height = try container.decode(Double.self, forKey: .height)
        weight = try container.decode(Double.self, forKey: .weight)
        birthday = try container.decode(Date.self, forKey: .birthday)
        nationality = try container.decode(String.self, forKey: .nationality)
        interestedGender = try container.decode(Gender.self, forKey: .interestedGender)
        languages = try container.decode([Language].self, forKey: .languages)
    }
}

extension FirestoreUser: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
      
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(gender, forKey: .gender)
        try container.encode(interests, forKey: .interests)
        try container.encode(places, forKey: .places)
        try container.encode(descriptions, forKey: .descriptions)
        try container.encode(bio, forKey: .bio)
        try container.encode(images, forKey: .images)
        try container.encode(height, forKey: .height)
        try container.encode(weight, forKey: .weight)
        try container.encode(birthday, forKey: .birthday)
        try container.encode(nationality, forKey: .nationality)
        try container.encode(interestedGender, forKey: .interestedGender)
        try container.encode(languages, forKey: .languages)
    }
}

