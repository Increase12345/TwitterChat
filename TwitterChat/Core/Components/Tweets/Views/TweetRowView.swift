//
//  TweetRowView.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/23/23.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    let vm: TweetRowViewModel
    
    init(tweet: Tweet) {
        self.vm = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // profile image + user info + tweet
            if let user = vm.tweet.user {
                HStack(alignment: .top, spacing: 12) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                    
                    // user info and tweet caption
                    VStack(alignment: .leading, spacing: 4) {
                        // user info
                        HStack {
                            Text(user.fullName)
                                .font(.subheadline.bold())
                                
                            Text(user.userName)
                                .foregroundColor(.secondary)
                                .font(.caption)
                            
                            Text("2w")
                                .foregroundColor(.secondary)
                                .font(.caption)
                        }
                        
                        // twit caption
                        Text(vm.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            
            // action buttons
            HStack {
                // button bubble
                Button {
                   
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                
                // button squarepath
                Button {
                    
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                Spacer()
                
                // button heart
                Button {
                    vm.likeTweet()
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()
                
                // button bookmark
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundColor(.secondary)
            
            Divider()
        }
        .padding()
    }
}
//
//struct TweetRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView(tweet: Tweet(uid: "", caption: "Example", timestamp: Date().timeIntervalSinceNow, likes: 10))
//    }
//}
