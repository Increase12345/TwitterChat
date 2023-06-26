//
//  ContentView.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var vm: AuthViewModel
    
    var body: some View {
        Group {
            // no user logged in
            if vm.userSession == nil {
                LoginView()
            } else {
                // have a logged in user
                mainInterfaceView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
                .environmentObject(AuthViewModel())
        }
    }
}

extension ContentView {
    var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu {
                ZStack {
                    Color.black
                        .opacity(showMenu ? 0.25: 0.0)
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0: -300)
                .background(showMenu ? .white: .clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.easeInOut) {
                        showMenu.toggle()
                    }
                } label: {
                    Circle()
                        .frame(width: 32, height: 32)
                }
            }
        }
        .onAppear {
            showMenu = false
        }
    }
}
