//
//  MockUserService.swift
//  TwitterCloneTests
//
//  Created by Takahiro Tominaga on 2022/03/15.
//

@testable import TwitterClone

struct MockUserService: UserServiceProtocol {
    func fetchUser(withUid uid: String, completion: @escaping (User) -> Void) {
        //        completion(.success(()))
        completion(User(id: "3", username: "hoge", fullname: "fuga", profileImageUrl: "eee", email: "ee"))
    }

    func fetchUsers(completion: @escaping ([User]) -> Void) {
        completion([User(id: "3", username: "hoge", fullname: "fuga", profileImageUrl: "eee", email: "ee")])
        //      completion(.success(User(id: "3", username: "hoge", fullname: "fuga", profileImageUrl: "eee", email: "ee")))
    }
}
