//
//  PokemonImages.swift
//  PokemonApp
//
//  Created by Gian Marco Fantini on 05/07/22.
//

import Foundation

actor PokemonImages: ObservableObject {
    
    @Published var pokemonImage: PokemonSprites?
    @Published var pokemonSprite = ""
    
    //    func getPokemonImages() async {
    //     guard let url = URL(
    //            return
    //        }
    //        do {
    //            let (data, _) = try await URLSession.shared.data(from: url)
    //
    //            if let decoderResponse = try? JSONDecoder().decode(DetailPokemon.self, from: data) {
    //                pokemonSprite = decoderResponse.sprites.front_default
    //            } else {
    //                print("test")
    //            }
    //        } catch {
    //            print("Data isn't valid")
    //        }
    //    }
    }


