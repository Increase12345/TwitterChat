//
//  Tweet.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/28/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Tweet: Identifiable, Codable {
    @DocumentID var id: String?
    let uid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var user: User?
}
