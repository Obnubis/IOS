//
//  ContentView.swift
//  proyectoIntegrador
//
//  Created by Mario Robles on 13/2/25.
//


import SwiftUI

struct ContentView: View {
    
    
    @State var usr: String = ""
    @State var pwd: String = ""
    
    var body: some View {
        VStack {
            
            VStack(spacing: 20) {
                Text("Bienvenido a Pokecartas.com")
                    .font(.custom("Arial", size: 24))
                    .bold()
                    .italic()
                TextField("Username", text: $usr)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .font(.headline)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(6)
                    .border(Color.black)
                    .padding(.horizontal, 60)
                    .foregroundStyle(Color.black)
                
                
                SecureField("Password", text: $pwd)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .font(.headline)
                    .background(Color.white.opacity(0.8))
                    .shadow(radius: 60)
                    .cornerRadius(6)
                    .border(Color.black)
                    .padding(.horizontal, 60)
                    .foregroundStyle(Color.black)
                
            }
            
            // Botón de inicio de sesión
            Button("Iniciar Sesión") {
                print("**********")
                print(" 👤 \(usr)")
                print("🔑 \(pwd)")
            }
            .padding(.bottom, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
