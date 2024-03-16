//
//  UserManager.swift
//  CauseMate
//
//  Created by Noga Gercsak on 3/16/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct DBUser: Codable {
    let userId: String
    let email: String?
    let dateCreated: Date?
    let name: String
    let dob: Date
    let zipCode: String
    let openToRemote: Bool
    let interests: [String]

    init(
        userId: String,
        email: String,
        dateCreated: Date,
        name: String,
        dob: Date,
        zipCode: String,
        openToRemote: Bool,
        interests: [String]
    ) {
        self.userId = userId
        self.email = email
        self.dateCreated = dateCreated
        self.name = name
        self.dob = dob
        self.zipCode = zipCode
        self.openToRemote = openToRemote
        self.interests = interests
    }

    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case email = "email"
        case dateCreated = "date_created"
        case name
        case dob
        case zipCode = "zip_code"
        case openToRemote = "open_to_remote"
        case interests
    }
}

final class UserManager {
    static let shared = UserManager()
    private init() {}

    private let userCollection = Firestore.firestore().collection("users")

    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }

    func createNewUser(user: DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false)
    }

    func getCurrentUserID() -> String {
        // Implement a method to get the current user ID, such as from Firebase Auth
        // Return the user ID as a string
        return "123456789" // Placeholder, replace with actual implementation
    }
    
    func getUser(userId: String) async throws -> DBUser {
           try await userDocument(userId: userId).getDocument(as: DBUser.self)
       }
}
