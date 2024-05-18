//
//  ContentView.swift
//  NotesAPP
//
//  Created by Alberto Ambriz on 17/05/24.
//
import SwiftUI

struct Nota {
    var nombre: String
    var descripcion: String
}

struct ContentView: View {
    
    @State private var notas = [
        Nota(nombre: "Bienvenido", descripcion: "Crea una nota en +")
    ]
    @State private var mostrarNuevaNota = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(notas, id: \.nombre) { nota in
                    NavigationLink(destination: {
                        Detalle(nota: nota, notas: $notas)
                    }) {
                        Fila(nota: nota)
                    }
                }
            }
            .navigationTitle("Notas")
            .toolbar {
                Button(action: {
                    mostrarNuevaNota.toggle()
                }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $mostrarNuevaNota) {
                NuevaNotaView(notas: $notas)
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Fila: View {
    let nota: Nota
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(nota.nombre)
                    .font(.headline)
                Text(nota.descripcion.prefix(30) + "...")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "pencil")
                .font(.title)
        }
    }
}
