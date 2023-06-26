//
//  AuthViewModel.swift
//  TwitterChat
//
//  Created by Nick Pavlov on 6/25/23.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        
    }
    
    func register(withEmail email: String, password: String, fullName: String, userName: String) {
        
    }
}
