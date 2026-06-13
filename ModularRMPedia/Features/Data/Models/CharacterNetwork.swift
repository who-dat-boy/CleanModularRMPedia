//
//  CharacterNetwork.swift
//  ModularRMPedia
//
//  Created by Arthur Danylenko on 13.06.2026.
//

struct Root: Decodable {
    let info: Info
    let results: [CharacterNetwork]
}

struct Info: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct CharacterNetwork: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Origin: Decodable {
    let name: String
    let url: String
}

struct Location: Decodable {
    let name: String
    let url: String
}
