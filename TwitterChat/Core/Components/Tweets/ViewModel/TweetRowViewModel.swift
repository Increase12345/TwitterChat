//
//  TweetRowViewModel.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/28/23.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    @Published var tweet: Tweet
    private let service = TweetService()
    
    init(tweet: Tweet) {
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    func likeTweet() {
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
    
    func checkIfUserLikedTweet() {
        service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike {
                self.tweet.didLike = true
            }
        }
    }
    
    func unLikeTweet() {
        service.unlikeTweet(tweet) {
            self.tweet.didLike = false
        }
    }
}
