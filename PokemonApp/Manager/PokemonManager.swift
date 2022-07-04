//
//  PokemonManager.swift
//  PokemonApp
//
//  Created by Gian Marco Fantini on 28/06/22.
//

import Foundation

//An Easy Way to retrieve data in View Model
//FIXME: I have to fix data models to require data from internet and not from local cache 
class PokemonManager {

    //TODO: Func that i need to convert by using try await so it should be async func
    //    func getPokemon(completionHandler: @escaping ([Pokemon]) -> ()) {
    //
    //        let jsonUrlString = "https://pokeapi.co/api/v2/pokemon?limit=151"
    //        guard let url = URL(string: jsonUrlString) else {
    //            return
    //        }
    //
    //        URLSession.shared.dataTask(with: url) { (data, response, error) in
    //
    //            guard let data = data, error == nil else {
    //                print(error!.localizedDescription)
    //                return
    //            }
    //
    //            do {
    //                let _ : [Pokemon] = try JSONDecoder().decode([Pokemon].self, from: data)
    //            } catch {
    //                print(error.localizedDescription)
    //            }
    //        }.resume()
    //    }
   
    
    //TODO: Func that i need to convert by using try await so it should be async fu
    //    func getDetailedPokemon(id: Int, _ completion: @escaping(DetailPokemon) -> ()) {
    //        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: DetailPokemon.self) { data in
    //            print(data)
    //            completion(data)
    //        } failure: { error in
    //            print(error)
    //        }
    //    }
}
