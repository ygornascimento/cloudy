//
//  SettingsTableViewCell.swift
//  Cloudy
//
//  Created by Bart Jacobs on 03/10/16.
//  Copyright © 2016 Cocoacasts. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    // MARK: - Properties

    @IBOutlet var mainLabel: UILabel!

    // MARK: - Initialization

    override func awakeFromNib() {
        super.awakeFromNib()

        // Configure Cell
        selectionStyle = .none
    }

}
