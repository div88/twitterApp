//
//  TweetCell.swift
//  twitterApp
//
//  Created by Divya Prabhakar on 10/11/14.
//  Copyright (c) 2014 Divya_Prabhakar. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var tweetScreenName: UILabel!
    @IBOutlet weak var tweetedText: UILabel!
    @IBOutlet weak var tweetedByName: UILabel!
    @IBOutlet weak var tweetedByPic: UIImageView!
    
    @IBOutlet weak var tweeteUserImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
