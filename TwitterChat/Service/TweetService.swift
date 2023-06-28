//
//  TweetService.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/27/23.
//

import Foundation
import Firebase

struct TweetService {
    
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid, "caption": caption, "likes": 0, "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("tweets").document().setData(data) { error in
            if let error {
                print("DEBUG: Failed to upload tweet \(error)")
                completion(false)
                return
            }
            
            completion(true)
        }
    }
}
