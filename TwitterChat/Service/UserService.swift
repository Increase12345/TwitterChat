//
//  UserService.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/26/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUid uid: String, comletion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
            guard let snapshot = snapshot else { return }
            
            guard let user = try? snapshot.data(as: User.self) else { return }
            
            comletion(user)
        }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        Firestore.firestore().collection("users").getDocuments { snapshot, _ in
        guard let documents = snapshot?.documents else { return }
        let users = documents.compactMap({ try? $0.data(as: User.self) })
        completion(users)
        }
    }
}
