//
//  PokemonList.swift
//  PokemonApp
//
//  Created by Gian Marco Fantini on 28/06/22.
//

import Foundation

// MARK: - PokemonList
struct PokemonList: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}
// MARK: - Pokemon
struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    var name: String
    var url: String
    
    static var samplePokemon = Pokemon(name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/4/")
}
// MARK: - Move
struct Move: Codable, Identifiable {
    let id = UUID()
    var name: String
    var url: String
}
// MARK: - DetailPokemon
struct DetailPokemon: Codable {
    let id: Int
//    let moves: [MoveElement]
    let height: Int
    let weight: Int
}
// MARK: - MoveElement
struct MoveElement: Codable {
    let move: MoveLearnMethodClass
    let versionGroupDetails: [VersionGroupDetail]
}

// MARK: - MoveLearnMethodClass
struct MoveLearnMethodClass: Codable {
    let name: String
    let url: String
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: MoveLearnMethodClass
}
