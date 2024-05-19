//
//  Detalle.swift
//  NotesAPP
//
//  Created by Alberto Ambriz on 18/05/24.
//

//
//  Detalle.swift
//  NotesAPP
//
//  Created by Alberto Ambriz on 18/05/24.
//

import SwiftUI

struct Detalle: View {
    @State private var nuevoNombre: String
    @State private var nuevaDescripcion: String
    @State private var mostrarAlerta = false
    
    let nota: Nota
    @Binding var notas: [Nota]
    
    init(nota: Nota, notas: Binding<[Nota]>) {
        self.nota = nota
        self._notas = notas
        self._nuevoNombre = State(initialValue: nota.nombre)
        self._nuevaDescripcion = State(initialValue: nota.descripcion)
    }
    
    var body: some View {
        VStack {
            TextField("Nuevo nombre", text: $nuevoNombre)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextEditor(text: $nuevaDescripcion)
                .frame(height: 250) // Ajusta la altura según sea necesario
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
            Button(action: {
                guard let index = notas.firstIndex(where: { $0.nombre == nota.nombre }) else { return }
                notas[index].nombre = nuevoNombre
                notas[index].descripcion = nuevaDescripcion
            }) {
                Text("Guardar")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            Button(action: {
                mostrarAlerta = true
            }) {
                Text("Eliminar Nota")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(-10)
            .alert(isPresented: $mostrarAlerta) {
                Alert(
                    title: Text("Eliminar Nota"),
                    message: Text("¿Estás seguro de que deseas eliminar esta nota?"),
                    primaryButton: .destructive(Text("Eliminar")) {
                        eliminarNota()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
        .navigationTitle(nota.nombre)
    }
    
    private func eliminarNota() {
        guard let index = notas.firstIndex(where: { $0.nombre == nota.nombre }) else { return }
        notas.remove(at: index)
    }
}

#Preview {
    Detalle(nota: Nota(nombre: "Nota1", descripcion: "Descripción de la nota 1"), notas: .constant([Nota(nombre: "Nota1", descripcion: "Descripción de la nota 1")]))
}
