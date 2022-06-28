//
//  PokemonList.swift
//  PokemonApp
//
//  Created by Gian Marco Fantini on 28/06/22.
//

import Foundation

struct PokemonList: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    var name: String
    var url: String
    
    static var samplePokemon = Pokemon(name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/4/")
}
//struct PokemonMoves: Codable {
//    let results: [Move]
//}
//
//struct Move: Codable, Identifiable {
//    let id = UUID()
//    var name: String
//    var url: String
//}

struct DetailPokemon: Codable {
    let id: Int
//    let moves: [String]?
    let height: Int
    let weight: Int
}
