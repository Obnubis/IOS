import SwiftUI

struct Perfil: View {
    
    @ObservedObject var controller: PerfilController
    @Binding var isLoggedIn: Bool 

    var body: some View {
        VStack {
            Image("pikachu")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .padding()

            Text("Datos del Usuario")
                .font(.title)
                .bold()
                .padding(.bottom, 10)

            VStack(spacing: 15) {
                Text("Nombre: \(controller.usuario.nombre)")
                    .padding(.horizontal, 40)

                Text("Dirección Postal: \(controller.usuario.CP.isEmpty ? "No registrada" : controller.usuario.CP)")
                    .padding(.horizontal, 40)

                Text("Correo Electrónico: \(controller.usuario.email)")
                    .padding(.horizontal, 40)
            }

            Toggle(isOn: $controller.usuario.newsletter) {
                Text("Suscripción al Newsletter")
                    .font(.subheadline)
            }
            .padding(.horizontal, 40)
            .padding(.top, 10)
            
            Button(action: {
                controller.cerrarSesion() 
                isLoggedIn = false  
            }) {
                Text("Cerrar sesión")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(20)
                    .padding(.horizontal, 40)
            }
            .padding(.top, 20)
        }
    }
}
