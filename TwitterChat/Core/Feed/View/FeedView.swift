//
//  FeedView.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/23/23.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var vm = FeedViewModel()
    @State private var showNewTweetView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(vm.tweets, id: \.id) { tweet in
                        TweetRowView(tweet: tweet)
                    }
                }
            }
            
            Button {
                showNewTweetView.toggle()
            } label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 60, height: 60)
                    .padding(5)
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView) {
                NewTweetView()
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
