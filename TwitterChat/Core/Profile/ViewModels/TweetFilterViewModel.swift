//
//  TweetFilterViewModel.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/23/23.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets, replies, likes
    
    var title: String {
        switch self {
        case.tweets:
            return "Tweets"
        case .replies:
            return "Replies"
        case .likes:
            return "Likes"
        }
    }
}
