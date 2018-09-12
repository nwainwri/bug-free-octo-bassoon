//
//  MainViewTableViewCell.swift
//  StretchMyHeader_SingleView
//
//  Created by Nathan Wainwright on 2018-09-11.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

import UIKit

class MainViewTableViewCell: UITableViewCell {
  @IBOutlet weak var cellCategory: UILabel!
  @IBOutlet weak var cellHeadline: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
