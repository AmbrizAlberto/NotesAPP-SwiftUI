//
//  NuevaNota.swift
//  NotesAPP
//
//  Created by Alberto Ambriz on 18/05/24.
//

import SwiftUI

struct NuevaNotaView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var nombre = ""
    @State private var descripcion = ""
    @Binding var notas: [Nota]
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Nombre de la nota", text: $nombre)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Descripción de la nota", text: $descripcion)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: {
                    let nuevaNota = Nota(nombre: nombre, descripcion: descripcion)
                    notas.append(nuevaNota)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Añadir Nota")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Nueva Nota")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}


#Preview {
    NuevaNotaView(notas: .constant([Nota(nombre: "Test", descripcion: "Test")]))
}
