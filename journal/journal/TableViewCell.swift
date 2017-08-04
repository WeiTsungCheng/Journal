//
//  TableViewCell.swift
//  journal
//
//  Created by Wei-Tsung Cheng on 2017/8/4.
//  Copyright © 2017年 Wei-Tsung Cheng. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var presentPhoto: UIImageView!
    @IBOutlet weak var locationName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
