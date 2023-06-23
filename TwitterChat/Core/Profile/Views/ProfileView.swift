//
//  ProfileView.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/23/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            
            actionButtons
            
            userInfoDetails
            
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
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                }
                
                Circle()
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
                Text("Edit Profile")
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
                Text("Nick Pavlov")
                    .font(.title2.bold())
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            
            Text("@increase")
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
            HStack(spacing: 24) {
                HStack(spacing: 4) {
                    Text("807")
                        .font(.subheadline.bold())
                    Text("Following")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                HStack(spacing: 4) {
                    Text("6,9M")
                        .font(.subheadline.bold())
                    Text("Followers")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
}
