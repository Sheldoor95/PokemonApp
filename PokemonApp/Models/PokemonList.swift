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

// MARK: - DetailPokemon
struct DetailPokemon: Codable {
    let id: Int
    let height: Int
    let weight: Int
}

