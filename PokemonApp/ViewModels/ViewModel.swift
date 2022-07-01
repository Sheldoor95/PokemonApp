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
    @Published var selector = 0 {
        didSet {
            if selector == 0 {
                sortList()
            } else {
                sortList(ascending: true)
            }
        }
    }
    
//   It's ok, the only case i should change it is if something change due to the refactoring
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
// FIXME: I have to fix data models
    init() {
//        self.pokemonList = pokemonManager.getPokemon()
        sortList()
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
    //Formatter for height and weight is ok
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        
        return string
    }
    
//    This func is ok and i could reuse it changing something as consequence of the refactoring
    func sortList(ascending: Bool = false) {
        if !ascending {
            self.pokemonList.sort {
                $0.name.lowercased() < $1.name.lowercased()
            }
        } else {
            self.pokemonList.sort {
                $0.name.lowercased() > $1.name.lowercased()
            }
        }
    }
}
