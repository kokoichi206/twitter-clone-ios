//
//  Tweet.swift
//  TwitterClone
//
//  Created by Takahiro Tominaga on 2022/03/12.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
}
