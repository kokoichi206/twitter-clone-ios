//
//  TweetFilterViewModel.swift
//  TwitterClone
//
//  Created by Takahiro Tominaga on 2022/03/12.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
