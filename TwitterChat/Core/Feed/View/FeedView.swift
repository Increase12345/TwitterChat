//
//  FeedView.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/23/23.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(0..<20, id: \.self) { _ in
                        TweetRowView()
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
                Text("New Tweet View")
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
