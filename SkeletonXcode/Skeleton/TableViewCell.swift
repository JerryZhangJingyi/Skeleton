//
//  TableViewCell.swift
//  Skeleton
//
//  Created by JingyiZhang on 12/11/17.
//  Copyright © 2017 jz. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var YearLabel : UILabel!
    @IBOutlet var SubLabel : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
