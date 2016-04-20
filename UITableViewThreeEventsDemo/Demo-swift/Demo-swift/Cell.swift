//
//  Cell.swift
//  Demo-20160418
//
//  Created by crw on 4/18/16.
//  Copyright © 2016 crw. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var delBtn: UIButton!
    
    var model : Model? {
        didSet{
            if let model = model {
                titleLabel.text = model.title
            }
        }
    }
    
}
