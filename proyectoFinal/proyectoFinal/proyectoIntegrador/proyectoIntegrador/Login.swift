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
                        isLoggedIn = true
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

                if let usuario = usuarioAutenticado {
                    NavigationLink("Ir a Perfil", destination: Perfil(controller: PerfilController(usuario: usuario), isLoggedIn: $isLoggedIn))
                }

                NavigationLink("¿No tienes cuenta? Regístrate", destination: Registro())
                    .foregroundColor(.blue)
            }
            .padding()
        }
    }
}
