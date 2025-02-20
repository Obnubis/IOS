import SwiftUI

struct Login: View {
    @State private var email: String = ""
    @State private var contraseña: String = ""
    @State private var usuarioAutenticado: Usuario?
    @State private var mostrarError = false
    @State private var isLoggedIn = false
    let usuarioController = UsuarioController()

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Bienvenido a Pokecartas.com")
                    .font(.title)
                    .bold()

                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)

                SecureField("Contraseña", text: $contraseña)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 40)

                Button("Iniciar Sesión") {
                    if let usuario = usuarioController.autenticar(email: email, contraseña: contraseña) {
                        usuarioAutenticado = usuario
                        isLoggedIn = true // Esto activa la navegación
                    } else {
                        mostrarError = true
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal, 40)

                if mostrarError {
                    Text("Usuario o contraseña incorrectos")
                        .foregroundColor(.red)
                }

                NavigationLink("¿No tienes cuenta? Regístrate", destination: Registro())
                    .foregroundColor(.blue)
            }
            .padding()
            // Este es el cambio clave: navegación automática al perfil cuando isLoggedIn es true
            .navigationDestination(isPresented: $isLoggedIn) {
                if let usuario = usuarioAutenticado {
                    Perfil(controller: PerfilController(usuario: usuario), isLoggedIn: $isLoggedIn)
                }
            }
        }
    }
}
