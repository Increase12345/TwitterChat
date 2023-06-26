//
//  SideMenuView.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/25/23.
//

import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject var vm: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 48, height: 48)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Nick Pavlov")
                        .font(.headline)
                    Text("@increase")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                UserStatsView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { vm in
                if vm == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(vm: vm)
                    }
                } else if vm == .logout {
                    Button {
                        self.vm.signOut()
                    } label: {
                        SideMenuOptionRowView(vm: vm)
                    }
                } else {
                    SideMenuOptionRowView(vm: vm)
                }
            }
            Spacer()
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
            .environmentObject(AuthViewModel())
    }
}

