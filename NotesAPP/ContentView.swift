//
//  ContentView.swift
//  NotesAPP
//
//  Created by Alberto Ambriz on 17/05/24.
//
import SwiftUI

// Declaracion de variables Principales
struct Nota {
    var nombre: String
    var descripcion: String
}

struct ContentView: View {
    
    @State private var notas = [
        Nota(nombre: "Bienvenido", descripcion: "Crea una nota en +")
    ]
    @State private var mostrarNuevaNota = false
    
    // Vista Principal
    var body: some View {
        //
        NavigationView{
            //Lista de notas por nombre
            List{
                // ForEach para generar la lista de notas por cada una que haya
                ForEach(notas, id: \.nombre) { nota in
                    // Navigation para declarar que la vista cambiara en funcion de cada nota
                    NavigationLink(destination: {
                        Detalle(nota: nota, notas: $notas)
                    }) {
                        Fila(nota: nota)
                    }
                }
            }
            // Nombre de Vista
            .navigationTitle("Notas")
            // Boton Superior
            .toolbar {
                // Boton para crear nueva nota
                Button(action: {
                    mostrarNuevaNota.toggle()
                }) {
                    // Icono + para el boton
                    Image(systemName: "plus")
                }
            }
            // Enlace a vista para crear nueva nota para actualizar la lista de notas
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
    
    // Vista de la lista de notas en Fila
    var body: some View {
        // Se muestra en horizontal
        HStack {
            // Y dentro en vertical
            VStack(alignment: .leading) {
                // El nombre de la nota
                Text(nota.nombre)
                    .font(.headline)
                // La descripcion hasta 30 caracteres y se agrega "..."
                Text(nota.descripcion.prefix(30) + "...")
                    .font(.footnote)
                    // color gris
                    .foregroundColor(.gray)
            }
            // Espacio para el icono de lapiz
            Spacer()
            Image(systemName: "pencil")
                // Tamaño de pincel grande
                .font(.title)
        }
    }
}
