//
//  FeedViewModel.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/28/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    let service = TweetService()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        service.fetchTweets { tweets in
            self.tweets = tweets
        }
    }
}
