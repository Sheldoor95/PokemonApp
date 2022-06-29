//
//  PokemonManager.swift
//  PokemonApp
//
//  Created by Gian Marco Fantini on 28/06/22.
//

import Foundation

//An Easy Way to retrieve data in View Model

class PokemonManager {
    func getPokemon() -> [Pokemon] {
        let data: PokemonList = Bundle.main.decodable(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results

        return pokemon
    }
    
    func getDetailedPokemon(id: Int, _ completion: @escaping(DetailPokemon) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: DetailPokemon.self) { data in
            print(data)
            completion(data)
        } failure: { error in
            print(error)
        }
    }
    
//    func getPokemonMoves(id: Int, _ completion: (Move)) -> () {
//        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/move/\(id)/", model: Move.self) { data in
//            completion(data)
//        } failure: { error in
//            print(error)
//        }
//    }
}
