//
//  ProfileViewModel.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/28/23.
//

import Foundation
import Firebase

class ProfileViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    private let service = TweetService()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchProfileUserTweet()
    }
    
    func fetchProfileUserTweet() {
        guard let uid = user.id else { return }
        service.fetchProfileUserTweet(forUid: uid) { tweets in
            self.tweets = tweets
            
            for i in 0..<tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
}
