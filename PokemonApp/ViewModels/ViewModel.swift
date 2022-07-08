//
//  ViewModel.swift
//  PokemonApp
//
//  Created by Gian Marco Fantini on 28/06/22.
//

import Foundation

@MainActor
final class ViewModel: ObservableObject {
    
     @Published var pokemonList = [Pokemon]()
     @Published var pokemonDetails: DetailPokemon?
     @Published var searchText = ""
//     @Published var selector = 0 {
//        didSet {
//            if selector == 0 {
//                sortList()
//            } else {
//                sortList(ascending: true)
//            }
//        }
//    }
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init() {
        Task {
            await getPokemon(page: 1)
//            sortList()
        }
    }
    
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        Task {
            await getDetailedPokemon(id: id)
        }
    }
    
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        
        return string
    }
    
//FIXME: The function only sorts the pokemon names and not the detailed view
//    func sortList(ascending: Bool = false) {
//        if !ascending {
//            self.pokemonList.sort {
//                $0.name.lowercased() < $1.name.lowercased()
//            }
//        } else {
//            self.pokemonList.sort {
//                $0.name.lowercased() > $1.name.lowercased()
//            }
//        }
//    }
}

extension ViewModel {
    
    func getPokemon(page: Int) async {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {
            print("I can't fetch pokemon's data")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoderResponse = try JSONDecoder().decode(PokemonList.self, from: data)
            pokemonList = decoderResponse.results

        } catch {
            print("Data isn't valid")
        }
    }
    
    func getDetailedPokemon(id: Int) async {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)/") else {
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoderResponse = try JSONDecoder().decode(DetailPokemon.self, from: data)
            pokemonDetails = decoderResponse
        } catch  {
            print("Data isn't valid")
        }
    }
}
