//
//  User.swift
//  appWithTwoViews
//
//  Created by Александр on 22.04.2022.
//

struct User {
    let login: String
    let password: String
    let person: Person
}

struct Person {
    let name: String
    let surname: String
    let dateOfBirth: String
    let education: [Education]
    let skills: [String]
    let achievements: [Achievement]
}

struct Achievement {
    let title: String
    let year: String
    let place = "None"
}

struct Education {
    let title: String
    let year: String
}
