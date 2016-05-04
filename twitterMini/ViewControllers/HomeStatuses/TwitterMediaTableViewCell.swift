//
//  TwitterTableViewCell.swift
//  twitterMini
//
//  Created by Tom O'Malley on 5/2/16.
//  Copyright © 2016 intrepid. All rights reserved.
//

import UIKit
import SDWebImage

class TwitterMediaTableViewCell : UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userScreenNameLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var textContentLabel: UILabel!
    @IBOutlet weak var mediaImageView: UIImageView!
    
    var status: TwitterStatus? {
        didSet{
            if let status = self.status {
                self.userNameLabel.text = status.user.name
                self.userScreenNameLabel.text = "@\(status.user.screenName)"
                self.createdAtLabel.text = status.timeSinceCreation
                self.textContentLabel.text = status.text
                self.userImageView.sd_setImageWithURL(NSURL(string: status.user.profileImageURL))
                
                if let mediaURLString = status.mediaURL,
                    let mediaURL = NSURL(string:mediaURLString) {
                    self.mediaImageView.sd_setImageWithURL(mediaURL)
                }
            }
        }
    }
}
