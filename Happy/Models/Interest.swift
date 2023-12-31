//
//  Interest.swift
//  Happy
//
//  Created by Fatih Yavuz on 18.06.2023.
//

import Foundation

struct Subcategory: Identifiable {
    let id = UUID()
    let name: String
    var isSelected: Bool = false
}

struct Interest: Identifiable {
    let id = UUID()
    let name: String
    var subcategories: [Subcategory]
    var isSelected: Bool = false
}

struct Interests {
    var interests: [Interest] = [
        Interest(name: "Sports", subcategories: [
            Subcategory(name: "Football"),
            Subcategory(name: "Basketball"),
            Subcategory(name: "Tennis"),
            Subcategory(name: "Baseball"),
            Subcategory(name: "Soccer"),
            Subcategory(name: "Swimming"),
            Subcategory(name: "Golf"),
            Subcategory(name: "Cricket"),
            Subcategory(name: "Hockey"),
            Subcategory(name: "Volleyball"),
            Subcategory(name: "Badminton"),
            Subcategory(name: "Table Tennis"),
            Subcategory(name: "Rugby"),
            Subcategory(name: "Cycling"),
            Subcategory(name: "Running"),
            Subcategory(name: "Weightlifting"),
            Subcategory(name: "Boxing"),
            Subcategory(name: "Wrestling"),
            Subcategory(name: "Martial Arts"),
            Subcategory(name: "Gymnastics")
        ]),
        Interest(name: "Music", subcategories: [
            Subcategory(name: "Rock"),
            Subcategory(name: "Pop"),
            Subcategory(name: "Hip Hop"),
            Subcategory(name: "Jazz"),
            Subcategory(name: "Classical"),
            Subcategory(name: "Country"),
            Subcategory(name: "R&B"),
            Subcategory(name: "Reggae"),
            Subcategory(name: "Electronic"),
            Subcategory(name: "Indie"),
            Subcategory(name: "Metal"),
            Subcategory(name: "Folk"),
            Subcategory(name: "Blues"),
            Subcategory(name: "Latin"),
            Subcategory(name: "Alternative"),
            Subcategory(name: "Punk"),
            Subcategory(name: "Gospel"),
            Subcategory(name: "Soul"),
            Subcategory(name: "Funk"),
            Subcategory(name: "Disco")
        ]),
        Interest(name: "Art", subcategories: [
            Subcategory(name: "Painting"),
            Subcategory(name: "Sculpture"),
            Subcategory(name: "Photography"),
            Subcategory(name: "Drawing"),
            Subcategory(name: "Digital Art"),
            Subcategory(name: "Street Art"),
            Subcategory(name: "Illustration"),
            Subcategory(name: "Mixed Media"),
            Subcategory(name: "Collage"),
            Subcategory(name: "Printmaking"),
            Subcategory(name: "Ceramics"),
            Subcategory(name: "Textile Art"),
            Subcategory(name: "Installation Art"),
            Subcategory(name: "Performance Art"),
            Subcategory(name: "Graffiti"),
            Subcategory(name: "Land Art"),
            Subcategory(name: "Conceptual Art"),
            Subcategory(name: "Minimalism"),
            Subcategory(name: "Abstract Art"),
            Subcategory(name: "Realism")
        ]),
        Interest(name: "Travel", subcategories: [
            Subcategory(name: "Adventure"),
            Subcategory(name: "Beach"),
            Subcategory(name: "Cultural"),
            Subcategory(name: "Nature"),
            Subcategory(name: "City Exploration"),
            Subcategory(name: "Hiking"),
            Subcategory(name: "Road Trip"),
            Subcategory(name: "Sightseeing"),
            Subcategory(name: "Historical"),
            Subcategory(name: "Wildlife"),
            Subcategory(name: "Mountains"),
            Subcategory(name: "Camping"),
            Subcategory(name: "Island"),
            Subcategory(name: "Cruise"),
            Subcategory(name: "Backpacking"),
            Subcategory(name: "Food Tour"),
            Subcategory(name: "Photography"),
            Subcategory(name: "Luxury"),
            Subcategory(name: "Family"),
            Subcategory(name: "Solo Travel")
        ]),
        Interest(name: "Food", subcategories: [
            Subcategory(name: "Italian"),
            Subcategory(name: "Mexican"),
            Subcategory(name: "Japanese"),
            Subcategory(name: "Chinese"),
            Subcategory(name: "Indian"),
            Subcategory(name: "Mediterranean"),
            Subcategory(name: "Thai"),
            Subcategory(name: "French"),
            Subcategory(name: "Greek"),
            Subcategory(name: "Spanish"),
            Subcategory(name: "Korean"),
            Subcategory(name: "American"),
            Subcategory(name: "Vegetarian"),
            Subcategory(name: "Vegan"),
            Subcategory(name: "Seafood"),
            Subcategory(name: "Steakhouse"),
            Subcategory(name: "Barbecue"),
            Subcategory(name: "Street Food"),
            Subcategory(name: "Desserts"),
            Subcategory(name: "Brunch")
        ]),
        Interest(name: "Fitness", subcategories: [
            Subcategory(name: "Gym Workouts"),
            Subcategory(name: "Running"),
            Subcategory(name: "Yoga"),
            Subcategory(name: "Cycling"),
            Subcategory(name: "Swimming"),
            Subcategory(name: "Pilates"),
            Subcategory(name: "HIIT"),
            Subcategory(name: "Weightlifting"),
            Subcategory(name: "CrossFit"),
            Subcategory(name: "Zumba"),
            Subcategory(name: "Boxing"),
            Subcategory(name: "Martial Arts"),
            Subcategory(name: "Dance"),
            Subcategory(name: "Pilates"),
            Subcategory(name: "Outdoor Activities"),
            Subcategory(name: "Group Classes"),
            Subcategory(name: "Functional Training"),
            Subcategory(name: "Fitness Challenges"),
            Subcategory(name: "Stretching"),
            Subcategory(name: "Personal Training")
        ]),
        Interest(name: "Movies", subcategories: [
            Subcategory(name: "Action"),
            Subcategory(name: "Comedy"),
            Subcategory(name: "Drama"),
            Subcategory(name: "Romance"),
            Subcategory(name: "Thriller"),
            Subcategory(name: "Horror"),
            Subcategory(name: "Science Fiction"),
            Subcategory(name: "Adventure"),
            Subcategory(name: "Fantasy"),
            Subcategory(name: "Animation"),
            Subcategory(name: "Documentary"),
            Subcategory(name: "Mystery"),
            Subcategory(name: "Crime"),
            Subcategory(name: "Family"),
            Subcategory(name: "Historical"),
            Subcategory(name: "Biography"),
            Subcategory(name: "Musical"),
            Subcategory(name: "Western"),
            Subcategory(name: "War"),
            Subcategory(name: "Superhero")
        ]),
        Interest(name: "Reading", subcategories: [
            Subcategory(name: "Fiction"),
            Subcategory(name: "Non-Fiction"),
            Subcategory(name: "Mystery"),
            Subcategory(name: "Thriller"),
            Subcategory(name: "Romance"),
            Subcategory(name: "Science Fiction"),
            Subcategory(name: "Fantasy"),
            Subcategory(name: "Biography"),
            Subcategory(name: "History"),
            Subcategory(name: "Self-Help"),
            Subcategory(name: "Business"),
            Subcategory(name: "Health"),
            Subcategory(name: "Travel"),
            Subcategory(name: "Memoir"),
            Subcategory(name: "Classic"),
            Subcategory(name: "Young Adult"),
            Subcategory(name: "Poetry"),
            Subcategory(name: "Horror"),
            Subcategory(name: "Cooking"),
            Subcategory(name: "Art")
        ]),
        Interest(name: "Gaming", subcategories: [
            Subcategory(name: "Action"),
            Subcategory(name: "Adventure"),
            Subcategory(name: "Role-Playing"),
            Subcategory(name: "Strategy"),
            Subcategory(name: "Simulation"),
            Subcategory(name: "Sports"),
            Subcategory(name: "Racing"),
            Subcategory(name: "Shooter"),
            Subcategory(name: "Platformer"),
            Subcategory(name: "Puzzle"),
            Subcategory(name: "Fighting"),
            Subcategory(name: "MMORPG"),
            Subcategory(name: "Stealth"),
            Subcategory(name: "Survival"),
            Subcategory(name: "Horror"),
            Subcategory(name: "Indie"),
            Subcategory(name: "Open World"),
            Subcategory(name: "Casual"),
            Subcategory(name: "VR"),
            Subcategory(name: "Esports")
        ]),
        Interest(name: "Fashion", subcategories: [
            Subcategory(name: "Casual"),
            Subcategory(name: "Formal"),
            Subcategory(name: "Streetwear"),
            Subcategory(name: "Athleisure"),
            Subcategory(name: "Bohemian"),
            Subcategory(name: "Vintage"),
            Subcategory(name: "Minimalist"),
            Subcategory(name: "Glamorous"),
            Subcategory(name: "Business"),
            Subcategory(name: "Preppy"),
            Subcategory(name: "Hipster"),
            Subcategory(name: "Classic"),
            Subcategory(name: "Edgy"),
            Subcategory(name: "Eclectic"),
            Subcategory(name: "Avant-Garde"),
            Subcategory(name: "Designer"),
            Subcategory(name: "Trendy"),
            Subcategory(name: "Sustainable"),
            Subcategory(name: "Plus Size"),
            Subcategory(name: "Maternity")
        ])
    ]

}
