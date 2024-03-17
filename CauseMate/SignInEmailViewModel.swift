//
//  SignInEmailViewModel.swift
//  CauseMate
//
//  Created by Noga Gercsak on 3/16/24.
//

import Foundation

@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var dateOfBirth = Date()
    @Published var zipCode = ""
    @Published var interestedInRemote = false
    @Published var interests = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        let authDataResult = try await AuthenticationManager.shared.createUser(email: email, password: password)
        
        // Split interests by commas and remove whitespace
        let interestsArray = interests.split(separator: ",").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        
        let user = DBUser(
            auth: authDataResult,
            name: name,
            dateOfBirth: dateOfBirth,
            zipCode: zipCode,
            interestedInRemote: interestedInRemote,
            interests: interestsArray
        )
        
        try await UserManager.shared.createNewUser(user: user)
    }
}
