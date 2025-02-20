//
//  usuario.swift
//  proyectoIntegrador
//
//  Created by Usuario invitado on 13/2/25.
//
import Foundation

struct Usuario: Codable {
    let id: Int
    let nombre: String
    let email: String
    let DP: String
    let imagen: String
    let notificaciones: Bool
    var newsletter: Bool
    let password: String
}
