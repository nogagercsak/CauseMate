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
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        let authDataResult = try await AuthenticationManager.shared.createUser(email: email, password: password)
        
        let newUser = DBUser(
            userId: authDataResult.uid,
            email: email,
            dateCreated: Date(),
            name: "",  // You'll need to get the name from the user input
            dob: Date(),  // You'll need to get the date of birth from the user input
            zipCode: "",  // You'll need to get the zip code from the user input
            openToRemote: false,  // You'll need to get this preference from the user input
            interests: []  // You'll need to get the interests from the user input
        )
        
        do {
            try await UserManager.shared.createNewUser(user: newUser)
            print("User signed up successfully.")
        } catch {
            print("Error signing up user: \(error.localizedDescription)")
        }
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
}
