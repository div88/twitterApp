//
//  TweetsViewController.swift
//  twitterApp
//
//  Created by Divya Prabhakar on 10/10/14.
//  Copyright (c) 2014 Divya_Prabhakar. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tweets: [Tweet]!
   // var multipleTweets: NSArray!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
       
        
        // Do any additional setup after loading the view.
        TwitterClient.sharedInstance.homeTimelineWithParams(nil, completion: {(tweets, error) -> () in
            self.tweets = tweets
            self.tableView.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogout(sender: AnyObject) {
        User.currentUser?.logout()
    }
  
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("TweetCell") as TweetCell
    
        if(self.tweets != nil && self.tweets?.count > 0){
            var tweetObj: Tweet = self.tweets[indexPath.row] as Tweet
            cell.tweetedByName.text = tweetObj.user?.name
            cell.tweetedText.text = tweetObj.text
            var posterUrl = tweetObj.user!.profileImageUrl as String!
            cell.tweeteUserImage.setImageWithURL(NSURL(string: posterUrl))
            println("Poster URL: \(posterUrl)")
            //cell.tweetedByPic.setImageWithURL(NSURL(string: posterUrl))


        }
       
        
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
