//
//  ViewModel.swift
//  PokemonApp
//
//  Created by Gian Marco Fantini on 28/06/22.
//

import Foundation


final class ViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: DetailPokemon?
    @Published var searchText = ""
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    init() {
        self.pokemonList = pokemonManager.getPokemon()
    }
    
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        
//        self.pokemonDetails = DetailPokemon(id: 0, moves: <#[Move]#>, height: 0, weight: 0)
        
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
    }
//Formatter for height and weight
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        
        return string
    }
    
    func sortList() -> [Pokemon] {
       let sortedPokemonList = pokemonList.sorted {
            $0.name.lowercased() < $1.name.lowercased()
        }
        return sortedPokemonList
    }
    func inverseSortList() -> [Pokemon] {
        let inverseSortingPokemonList =  pokemonList.sorted {
            $0.name.lowercased() > $1.name.lowercased()
        }
        return inverseSortingPokemonList
    }
}
