//
//  TwitterDetailViewController.swift
//  twitterApp
//
//  Created by Divya Prabhakar on 10/17/14.
//  Copyright (c) 2014 Divya_Prabhakar. All rights reserved.
//

import UIKit

class TwitterDetailViewController: UIViewController {

    
    @IBOutlet weak var tweetTextLabel: UILabel!
    var tweetDetails:Tweet!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var tweetUserName: UILabel!
    @IBOutlet weak var userNaMeLight: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var posterUrl = tweetDetails.user!.profileImageUrl as String!
        userProfileImage.setImageWithURL(NSURL(string: posterUrl))
        
        tweetUserName.text = tweetDetails.user?.name
        
        var screenName = tweetDetails.user?.screenname as String!
        userNaMeLight.text = "@\(screenName)"
        
        tweetText.text = tweetDetails.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
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
