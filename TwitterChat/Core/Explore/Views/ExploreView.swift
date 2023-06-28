//
//  ExploreView.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/23/23.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var vm = ExploreViewModel()
    
    var body: some View {
        VStack {
            SearchBar(text: $vm.searchText)
                .padding()
            
            ScrollView {
                LazyVStack {
                    ForEach(vm.searchableUsers, id: \.id) { user in
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
