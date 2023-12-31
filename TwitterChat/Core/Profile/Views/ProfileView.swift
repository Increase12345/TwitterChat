//
//  ProfileView.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/23/23.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @ObservedObject var vm: ProfileViewModel
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Environment(\.dismiss) var dismiss
    @Namespace var animation
    
    init(user: User) {
        self.vm = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            actionButtons
            
            userInfoDetails
            
            tweetFilterBar
            
            tweetsView
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(userName: "Nick", fullName: "Pavlov", profileImageUrl: "", email: "increase"))
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 10, y: 0)
                }
                
                KFImage(URL(string: vm.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 72, height: 72)
                    .offset(x: 16, y: 24)
            }
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View {
        HStack(spacing: 12) {
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.secondary, lineWidth: 0.75))
            
            Button {
                
            } label: {
                Text(vm.actionButtonTitle)
                    .font(.subheadline)
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
        .padding(.trailing)
    }
    
    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(vm.user.fullName)
                    .font(.title2.bold())
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@\(vm.user.userName)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("I love to code with Swift")
                .font(.subheadline)
                .padding(.vertical)
            
            // location and link
            HStack(spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Aurora, CO")
                }
                
                HStack {
                    Image(systemName: "link")
                    Text("www.freecode.pythonanywhere.com")
                }
            }
            .foregroundColor(.secondary)
            .font(.caption)
            
            // Following/Followers
            UserStatsView()
                .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var tweetFilterBar: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold: .regular)
                        .foregroundColor(selectedFilter == item ? .black: .secondary)
                    
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 16))
    }
    
    var tweetsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(vm.tweets(forFilter: self.selectedFilter), id: \.id) { tweet in
                    TweetRowView(tweet: tweet)
                }
            }
        }
    }
}
