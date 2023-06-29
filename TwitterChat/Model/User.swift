//
//  User.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/26/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    let userName: String
    let fullName: String
    let profileImageUrl: String
    let email: String
    
    var isCurrentUser: Bool {
        Auth.auth().currentUser?.uid == id
    }
}


