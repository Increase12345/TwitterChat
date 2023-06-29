//
//  TweetRowViewModel.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/28/23.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    let tweet: Tweet
    private let service = TweetService()
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
    func likeTweet() {
        service.likeTweet(tweet)
    }
}
