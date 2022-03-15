//
//  MockTweetService.swift
//  TwitterCloneTests
//
//  Created by Takahiro Tominaga on 2022/03/15.
//

import Foundation
@testable import TwitterClone
import Firebase

struct MockTweetService: TweetServiceProtocol {
    func uploadTweet(caption: String, completion: @escaping (Bool) -> Void) {

    }

    func fetchTweets(completion: @escaping ([Tweet]) -> Void) {

    }

    func fetchTweets(forUid uid: String, completion: @escaping ([Tweet]) -> Void) {
        completion([Tweet(id: "3", caption: "title",
                          timestamp: Timestamp(date: Date()),
                          uid: "uid", likes: 3,
                          user: User(id: "3", username: "hoge", fullname: "fuga", profileImageUrl: "eee", email: "ee"),
                          didLike: true)])
    }

    func likeTweet(_ tweet: Tweet, completion: @escaping () -> Void) {

    }

    func unLikeTweet(_ tweet: Tweet, completion: @escaping () -> Void) {

    }

    func checkIfUserLikeTweet(_ tweet: Tweet, completion: @escaping (Bool) -> Void) {

    }

    func fetchLikedTweets(forUid uid: String, completion: @escaping ([Tweet]) -> Void) {

    }

}
