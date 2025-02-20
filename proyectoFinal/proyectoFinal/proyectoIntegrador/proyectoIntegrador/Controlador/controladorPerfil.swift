import SwiftUI

class PerfilController: ObservableObject {
    @Published var usuario: Usuario
    @Published var newsletter: Bool
    @Published var sesionCerrada: Bool = false

    init(usuario: Usuario) {
        self.usuario = usuario
        self.newsletter = usuario.newsletter
    }

    func cerrarSesion() {
        print("Sesión cerrada")
        sesionCerrada = true  
    }

    func actualizarNewsletter() {
        print("Newsletter actualizado: \(newsletter)")
    }
}
