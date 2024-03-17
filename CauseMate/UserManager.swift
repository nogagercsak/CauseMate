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
    let name: String?
    let dateOfBirth: Date?
    let zipCode: String?
    let interestedInRemote: Bool
    let interests: [String]
    
    init(auth: AuthDataResultModel, name: String?, dateOfBirth: Date?, zipCode: String?, interestedInRemote: Bool, interests: [String]) {
        self.userId = auth.uid
        self.email = auth.email
        self.dateCreated = Date()
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.zipCode = zipCode
        self.interestedInRemote = interestedInRemote
        self.interests = interests
    }
    
    init(
        userId: String,
        email: String? = nil,
        dateCreated: Date? = nil,
        name: String? = nil,
        dateOfBirth: Date? = nil,
        zipCode: String? = nil,
        interestedInRemote: Bool? = nil,
        interests: [String]
    ) {
        self.userId = userId
        self.email = email
        self.dateCreated = dateCreated
        self.name = name
        self.dateOfBirth = dateOfBirth
        self.zipCode = zipCode
        self.interestedInRemote = interestedInRemote ?? false
        self.interests = interests
    }
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case userId = "user_id"
        case dateCreated = "date_created"
        case name = "name"
        case dateOfBirth = "date_of_birth"
        case zipCode = "zip_code"
        case interestedInRemote = "interested_in_remote"
        case interests = "interests"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.dateCreated = try container.decodeIfPresent(Date.self, forKey: .dateCreated)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.dateOfBirth = try container.decodeIfPresent(Date.self, forKey: .dateOfBirth)
        self.zipCode = try container.decodeIfPresent(String.self, forKey: .zipCode)
        self.interestedInRemote = try container.decode(Bool.self, forKey: .interestedInRemote)
        self.interests = try container.decode([String].self, forKey: .interests)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.dateOfBirth, forKey: .dateOfBirth)
        try container.encodeIfPresent(self.zipCode, forKey: .zipCode)
        try container.encode(self.interestedInRemote, forKey: .interestedInRemote)
        try container.encode(self.interests, forKey: .interests)
    }
}


final class UserManager{
    
    static let shared = UserManager()
    private init() { }
    
    private let userCollection = Firestore.firestore().collection("users")
    
    private func userDocument(userId:String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        //encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        //Decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func createNewUser(user:DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false)
    }
    
    //func createNewUser(auth: AuthDataResultModel) async throws{
    //var userData: [String:Any] = [
    //"user_id" : auth.uid,
    //          "date_created" : Timestamp(),
    //     ]
    //    if let email = auth.email{
    //       userData["email"] = email
    //  }
    //        if let photoUrl = auth.photoUrl{
    //           userData["photo_url"] = photoUrl
    //      }
    //     try await userDocument(userId: auth.uid).setData(userData, merge: false)
    //  }
    
    func getUser(userId: String) async throws -> DBUser {
        try await userDocument(userId: userId).getDocument(as: DBUser.self)
        
    }
}

