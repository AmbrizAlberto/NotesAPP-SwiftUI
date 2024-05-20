//
//  NuevaNota.swift
//  NotesAPP
//
//  Created by Alberto Ambriz on 18/05/24.
//

import SwiftUI

struct NuevaNotaView: View {
    
    // Declaracion de variables de entorno y estado
    @Environment(\.presentationMode) var presentationMode
    @State private var nombre = ""
    @State private var descripcion = ""
    @Binding var notas: [Nota]
    
    // Vista para Crear nueva Nota
    var body: some View {
        // Vista
            // En vertical
            VStack {
                // Input para nombre de nueva nota
                TextField("Nombre de la nota", text: $nombre)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                // Input para descripcion de nueva nota
                TextField("Descripción de la nota", text: $descripcion)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                // Boton para Crear la nota
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
            // Titulo que se mostrara en la vista
            .navigationTitle("Nueva Nota")
            // Boton para cancelar la creacion de la nota
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }


#Preview {
    NuevaNotaView(notas: .constant([Nota(nombre: "Test", descripcion: "Test")]))
}
