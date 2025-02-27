//
//  controladorUsuario.swift
//  proyectoIntegrador
//
//  Created by Usuario invitado on 13/2/25.
//
import Foundation

class UsuarioController {
    var usuarios: [Usuario] = []

    init() {
        cargarUsuarios()
    }

    struct UsuariosWrapper: Codable {
        let usuarios: [Usuario]
    }

    func cargarUsuarios() {
        if let url = Bundle.main.url(forResource: "Usuarios", withExtension: "json") {
            print("Archivo JSON encontrado en la ruta: \(url.path)")
            do {
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode(UsuariosWrapper.self, from: data)
                self.usuarios = decodedData.usuarios
            } catch {
                print("Error al cargar JSON: \(error.localizedDescription)")
            }
        } else {
            print("No se encontró el archivo JSON en la carpeta 'datos'.")
        }
    }

    func autenticar(email: String, contraseña: String) -> Usuario? {
        print("Intentando autenticar con Email: \(email) y Contraseña: \(contraseña)")
        
        for usuario in usuarios {
            print("Comparando con: \(usuario.email) | Password: \(usuario.password)")
            
            if usuario.email.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) ==
               email.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) &&
               usuario.password == contraseña {
                print("Usuario autenticado correctamente: \(usuario.nombre)")
                return usuario
            }
        }
        return nil
    }


}

