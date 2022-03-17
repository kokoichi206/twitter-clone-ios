//
//  ProrileViewModelSpec.swift
//  TwitterCloneTests
//
//  Created by Takahiro Tominaga on 2022/03/15.
//

import XCTest
@testable import TwitterClone

class ProrileViewModelSpec: XCTestCase {

    var viewModel: ProfileViewModel!
    var mockUserService: MockUserService!

    override func setUp() {
        mockUserService = MockUserService()
        viewModel = .init(
            user: User(id: "3", username: "hoge", fullname: "fuga", profileImageUrl: "eee", email: "ee"),
            userService: mockUserService
        )
    }

    func testTweetsWithCaseLikesReturnsCorrectly() {
        viewModel.fetchUserTweets()

        viewModel.fetchUserTweets()
        XCTAssertFalse(viewModel.tweets.isEmpty)
    }
}
