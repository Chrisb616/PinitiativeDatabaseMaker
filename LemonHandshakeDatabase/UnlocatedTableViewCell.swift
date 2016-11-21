//
//  UnlocatedTableViewCell.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 11/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class UnlocatedTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "unlocatedCell")
        
        configureCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        
    }
}
