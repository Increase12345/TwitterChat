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
    @Published var likedTweets = [Tweet]()
    
    private let userService = UserService()
    private let service = TweetService()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchProfileUserTweet()
        self.fetchLikedTweets()
    }
    
    func tweets(forFilter filter: TweetFilterViewModel) -> [Tweet] {
        switch filter {
        case .tweets:
            return tweets
        case .replies:
            return tweets
        case .likes:
            return likedTweets
        }
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
    
    func fetchLikedTweets() {
        guard let uid = user.id else { return }
        
        service.fetchLikedTweets(forUid: uid) { tweets in
            self.likedTweets = tweets
            
            for i in 0..<tweets.count {
                let uid = tweets[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.likedTweets[i].user = user
                }
            }
        }
    }
}
