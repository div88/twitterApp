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
    var loginCompletion: ((user: User?, error: NSError?) -> ())?
    
    class var sharedInstance: TwitterClient{
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        return Static.instance
    }
    
    func homeTimelineWithParams(params: NSDictionary?, completion: (tweets: [Tweet]?, error: NSError?) -> ()){
        GET("1.1/statuses/home_timeline.json", parameters: params, success:{ (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
            //println("home timeline: \(response)")
            var tweets = Tweet.tweetsWithArray(response as [NSDictionary])
            completion(tweets: tweets, error: nil)
            for tweet in tweets {
              //println("text: \(tweet.text), created: \(tweet.createdAt)")
            }
        }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
            println("error getting current user")
            completion(tweets: nil, error: error)
        })
        
    }
    
    func loginWithCompletion(completion: (user: User?, error: NSError?) -> ()) {
        loginCompletion = completion
        
        //fetch request token and redirect to authorization page
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "cptwitterApp://oauth"), scope: nil, success: { (requestToken: BDBOAuthToken!) -> Void in
            println("Got the request token")
            var authURL = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")
            UIApplication.sharedApplication().openURL(authURL)
            }) { (error: NSError!) -> Void in
                println("Failed to get request token")
                self.loginCompletion?(user: nil, error: error)
        }
    }
    
    func openURL(url: NSURL) {
        fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken: BDBOAuthToken(queryString: url.query), success: {(accessToken: BDBOAuthToken!) -> Void in
            println("Got the access token!")
            TwitterClient.sharedInstance.requestSerializer.saveAccessToken(accessToken)
            
            TwitterClient.sharedInstance.GET("1.1/account/verify_credentials.json", parameters: nil, success: {(operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                //  println("user: \(response)")
                var user = User(dictionary: response as NSDictionary)
                User.currentUser = user
                //println("user: \(user.name)")
                }, failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                    println("error getting current user")
            })
            
          
            
            
            }) { (error: NSError!) -> Void in
                println("Failed to receive access token")
        }
    }
    
    
}
