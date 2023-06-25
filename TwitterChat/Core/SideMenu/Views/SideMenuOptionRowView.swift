//
//  SideMenuOptionRowView.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/25/23.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    let vm: SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: vm.imageName)
                .font(.headline)
                .foregroundColor(.secondary)
            
            Text(vm.title)
                .foregroundColor(.black)
                .font(.subheadline)
            
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(vm: .profile)
    }
}
