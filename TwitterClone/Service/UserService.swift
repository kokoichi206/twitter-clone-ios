//
//  UserService.swift
//  TwitterClone
//
//  Created by Takahiro Tominaga on 2022/03/12.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
        print("DEBUG: Fetch user info..")
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self) else { return }
                
                print("DEBUG: Username is \(user.username)")
                print("DEBUG: Email is \(user.email)")
                
                completion(user)
            }
    }
}
