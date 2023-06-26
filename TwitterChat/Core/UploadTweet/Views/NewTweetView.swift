//
//  NewTweetView.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/25/23.
//

import SwiftUI

struct NewTweetView: View {
    @Environment(\.dismiss) var dismiss
    @State private var caption = ""
    
    var body: some View {
        VStack {
            HStack {
                
                // Cancel button
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.blue)
                }
                
                Spacer()
                
                // Tweet button
                Button {
                    
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                TextArea("What's happening", text: $caption)
            }
            .padding()
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
