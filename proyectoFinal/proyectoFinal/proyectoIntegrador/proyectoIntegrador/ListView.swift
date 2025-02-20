//
//  ListView.swift
//  listass
//
//  Created by Usuario invitado on 20/2/25.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List{
            RowView(pokemon: Pokemon(id: 1, name: "Pikachu", descripcion: "carta de pikachu", prrecio: 200, imagen: "pikachu1"))
            RowView(pokemon: Pokemon(id: 2, name: "Darkrai", descripcion: "carta de darkrai", prrecio: 20, imagen: "darkrai"))
            RowView(pokemon: Pokemon(id: 3, name: "Rayquaza", descripcion: "carta de pikachu", prrecio: 100, imagen: "rayquaza"))
            RowView(pokemon: Pokemon(id: 4, name: "shymin", descripcion: "carta de pikachu", prrecio: 400, imagen: "greninja"))
            RowView(pokemon: Pokemon(id: 5, name: "mewtwo", descripcion: "carta de mewtwo", prrecio: 300, imagen: "mewtwo"))
            
        }
    }
}

#Preview {
    ListView()
}
