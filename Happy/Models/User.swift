//
//  User.swift
//  Happy
//
//  Created by Fatih Yavuz on 18.06.2023.
//
import Foundation

@MainActor class User: Identifiable, ObservableObject {
    @Published var _id: UUID = .init()
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var gender: Gender = Gender(name: GenderEnum.other.rawValue)
    @Published var interests: [Interest] = Interests().interests
    @Published var places: [Place] = []
    @Published var descriptions: [Description] = Descriptions().descriptions
    @Published var bio: String = ""
    @Published var images: [Data] = []
    @Published var height: Double = 150.0
    @Published var weight: Double = 80.0
    @Published var birthday = Date()
    @Published var nationality: String = ""
    @Published var interestedGender: Gender = Gender(name: GenderEnum.other.rawValue)
    @Published var languages: [Language] = []
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case email
        case password
        case gender
        case interests
        case visitedPlaces
        case selfDescription
        case bio
        case profileImages
    }
}
