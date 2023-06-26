//
//  ProfilePhotoSelectorView.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/26/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Create your account", title2: "Add a profile photo")
            
            Button {
                
            } label: {
                Image("addPhoto")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding(.top, 50)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
