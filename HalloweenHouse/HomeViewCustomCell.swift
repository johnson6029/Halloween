//
//  HomeViewCustomCell.swift
//  HalloweenTheme
//
//  Created by Johnson Khristi  on 2017-11-05.
//  Copyright © 2017 Johnson Khristi . All rights reserved.
//

import Foundation
import UIKit

public class HomeViewCustomCell : UITableViewCell
{
    @IBOutlet weak var imgview_Home: UIImageView!
    @IBOutlet weak var label_Address: UILabel!
    @IBOutlet weak var imgview_Emotions: UIImageView!
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
