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
    let id = UUID()     // Può diventare un Int per matcharlo con l'id di DetailPokemon?
    var name: String
    var url: String
    static var samplePokemon = Pokemon(name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/4/")
}

// MARK: - DetailPokemon
struct DetailPokemon: Codable {
    let id: Int
    let height: Int
    let weight: Int
    //    let moves: [Move]
    let species: Species
    var sprites: PokemonSprites
}

//MARK: - PokemonSprites
struct PokemonSprites: Codable {
    var front_default: String
}

// MARK: - Move
struct Move: Codable {
    let move: Species
    let versionGroupDetails: [VersionGroupDetail]
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: Species
}

// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String
}


