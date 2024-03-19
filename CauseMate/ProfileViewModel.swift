//
//  ProfileViewModel.swift
//  CauseMate
//
//  Created by Noga Gercsak on 3/18/24.
//


import Foundation


@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: DBUser? = nil
    @Published var selectedNonprofits: [String] = [] // New property for selected nonprofits
    
    func loadCurrentUser() async throws {
        let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
        
        // Load selected nonprofits from user data
        if let nonprofitNames = user?.selectedNonprofits {
            self.selectedNonprofits = nonprofitNames
        }
    }
    
    func saveSelectedNonprofits() {
        // Save selected nonprofits to user data
        if let userId = user?.userId {
            UserManager.shared.updateSelectedNonprofits(userId: userId, nonprofits: selectedNonprofits)
        }
    }
}
