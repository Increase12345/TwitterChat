//
//  NewTweetView.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/25/23.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @ObservedObject var vm = UploadTweetViewModel()
    @EnvironmentObject var AuthVM: AuthViewModel
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
                    vm.uploadTweet(withCaption: caption)
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
                if let user = AuthVM.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                }
                
                TextArea("What's happening", text: $caption)
            }
            .padding()
        }
        .onReceive(vm.$didUploadTweet) { success in
            if success {
                dismiss()
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
            .environmentObject(AuthViewModel())
    }
}
