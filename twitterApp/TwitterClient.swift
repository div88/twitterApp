//
//  TwitterClient.swift
//  twitterApp
//
//  Created by Divya Prabhakar on 10/5/14.
//  Copyright (c) 2014 Divya_Prabhakar. All rights reserved.
//

import UIKit

let twitterConsumerKey = "qzByUVqyKpvmD2NzWgL0rG8by"
let twitterConsumerSecret = "c2JmdeQ0l1awhcFdY1oj1xaB39UJLWwQnpdLz0suGEpbJObBo8"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1RequestOperationManager{
    class var sharedInstance: TwitterClient{
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        return Static.instance
    }
}
