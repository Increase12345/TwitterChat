//
//  ExploreViewModel.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/27/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    let service = UserService()
    
    var searchableUsers: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()
            return users.filter({ $0.userName.contains(lowercasedQuery) || $0.fullName.lowercased().contains(lowercasedQuery) })
        }
    }
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
}
