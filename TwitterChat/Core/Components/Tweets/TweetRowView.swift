//
//  TweetRowView.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/23/23.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack {
            
            // profile image + user info + tweet
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                // user info and tweet caption
                VStack(alignment: .leading, spacing: 4) {
                    // user info
                    HStack {
                        Text("Bruce Wayne")
                            .font(.subheadline.bold())
                            
                        Text("@increase")
                            .foregroundColor(.secondary)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.secondary)
                            .font(.caption)
                    }
                    
                    // twit caption
                    Text("I believe in Harvey Dent")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            
            // action buttons
            HStack {
                Button {
                    // action goes here
                } label: {
                    Text("")
                }
            }
        }
    }
}

struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
