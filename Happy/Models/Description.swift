//
//  Description.swift
//  Happy
//
//  Created by Fatih Yavuz on 19.06.2023.
//

import Foundation

struct Description: Identifiable {
    let id = UUID()
    let name: String
    var isSelected: Bool = false
}

struct Descriptions {
    var descriptions: [Description] = [
        Description(name: "Adventurous"),
        Description(name: "Ambitious"),
        Description(name: "Artistic"),
        Description(name: "Authentic"),
        Description(name: "Brave"),
        Description(name: "Calm"),
        Description(name: "Charismatic"),
        Description(name: "Compassionate"),
        Description(name: "Confident"),
        Description(name: "Creative"),
        Description(name: "Curious"),
        Description(name: "Determined"),
        Description(name: "Energetic"),
        Description(name: "Friendly"),
        Description(name: "Funny"),
        Description(name: "Generous"),
        Description(name: "Genuine"),
        Description(name: "Grateful"),
        Description(name: "Happy"),
        Description(name: "Honest"),
        Description(name: "Humorous"),
        Description(name: "Imaginative"),
        Description(name: "Intelligent"),
        Description(name: "Kind"),
        Description(name: "Loyal"),
        Description(name: "Optimistic"),
        Description(name: "Passionate"),
        Description(name: "Patient"),
        Description(name: "Resilient"),
        Description(name: "Sincere"),
        Description(name: "Strong"),
        Description(name: "Supportive"),
        Description(name: "Talented"),
        Description(name: "Thoughtful"),
        Description(name: "Trustworthy"),
        Description(name: "Understanding"),
        Description(name: "Witty"),
        Description(name: "Adaptable"),
        Description(name: "Analytical"),
        Description(name: "Assertive"),
        Description(name: "Bold"),
        Description(name: "Charming"),
        Description(name: "Cooperative"),
        Description(name: "Courageous"),
        Description(name: "Decisive"),
        Description(name: "Empathetic"),
        Description(name: "Enthusiastic"),
        Description(name: "Flexible"),
        Description(name: "Graceful"),
        Description(name: "Humble"),
        Description(name: "Innovative"),
        Description(name: "Inspiring")
    ]
}
