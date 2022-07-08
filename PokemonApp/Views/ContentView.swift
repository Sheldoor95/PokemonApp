//
//  ContentView.swift
//  PokemonApp
//
//  Created by Gian Marco Fantini on 27/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
   
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
//                    Picker("Sort the list", selection: $vm.selector) {
//                        Text("Alphabetical").tag(0)
//                        Text("Reverse").tag(1)
//                    }
//                    .pickerStyle(.segmented)
//                    .padding()
                    LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                        ForEach(vm.filteredPokemon) { pokemon in
                            NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                                PokemonView(pokemon: pokemon)
                            }
                        }
                    }
                    .animation(.easeInOut(duration: 0.4), value: vm.filteredPokemon.count)
                    .navigationTitle("Pokedex")
                    .navigationBarTitleDisplayMode(.inline)
                }
                .searchable(text: $vm.searchText)
            }
        }
        .navigationViewStyle(.stack)
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
