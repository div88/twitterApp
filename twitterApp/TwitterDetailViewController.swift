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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
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
