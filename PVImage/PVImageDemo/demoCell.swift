//
//  demoCellTableViewCell.swift
//  PVImageView
//
//  Created by Parth Vasavada on 24/11/19.
//  Copyright © 2019 Parth Vasavada. All rights reserved.
//

import UIKit

class demoCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var asyncImageView: PVImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
