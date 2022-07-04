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
//    let previuous: String
    let results: [Pokemon]
}
// MARK: - Pokemon
struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    var name: String
    var url: String
    
    static var samplePokemon = Pokemon(name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/4/")
}

// MARK: - DetailPokemon
struct DetailPokemon: Codable {
    let id: Int
    let height: Int
    let weight: Int
}

////MARK: - Moves
//struct Moves: Codable {
//    var moves: [MoveElement]
//}
//
//// MARK: - MoveElement
//struct MoveElement: Codable {
//    let move: MoveLearnMethodClass
//    let versionGroupDetails: [VersionGroupDetail]
//}
//
//// MARK: - MoveLearnMethodClass
//struct MoveLearnMethodClass: Codable {
//    var name: String
//    let url: String
//}
//
//// MARK: - VersionGroupDetail
//struct VersionGroupDetail: Codable {
//    let levelLearnedAt: Int
//    let moveLearnMethod, versionGroup: MoveLearnMethodClass
//}
// MARK: - Moves
struct Moves: Codable {
    let moves: [Move]
    let versionGroupDetails: [VersionGroupDetail]
}

// MARK: - Move
struct Move: Codable {
    let name: String
    let url: String
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: Move
}
