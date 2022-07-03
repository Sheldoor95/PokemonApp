//
//  ViewModel.swift
//  PokemonApp
//
//  Created by Gian Marco Fantini on 28/06/22.
//

import Foundation


final class ViewModel: ObservableObject {
    //    private let pokemonManager = PokemonManager()
    @Published var pokemonList = [Pokemon]()
//    @Published var pokemonList2: PokemonList?
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
        Task {
            await getPokemon()
            sortList()
        }
    }
    
    //    It could be ok
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    //TODO: I have to change this func since getDetailedPokemon will change
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        
        Task {
            await getDetailedPokemon(id: id)
        }
    }
    
    //Formatter for height and weight is ok
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        
        return string
    }
    
    //  This func is ok and i could reuse it changing something as consequence of the refactoring
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

extension ViewModel {
    //    Manager
    @MainActor
    func getPokemon() async {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {
            print("I can't fetch pokemon's data")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decoderResponse = try? JSONDecoder().decode(PokemonList.self, from: data) {
              pokemonList = decoderResponse.results
            } else {
                print("oh nooo")
            }
        } catch {
            print("Data is't valid")
        }
    }
    
    //    Manager
    @MainActor
    func getDetailedPokemon(id: Int) async {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)/") else {
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decoderResponse = try? JSONDecoder().decode(DetailPokemon.self, from: data) {
                pokemonDetails = decoderResponse
            } else {
                print("oh nooo 2")
            }
        } catch  {
            print("Data is'n valid")
        }
    }
}
