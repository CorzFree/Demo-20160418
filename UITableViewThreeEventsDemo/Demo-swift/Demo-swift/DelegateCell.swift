//
//  DelegateCell.swift
//  Demo-20160418
//
//  Created by crw on 4/20/16.
//  Copyright © 2016 crw. All rights reserved.
//

import UIKit

protocol CellDelegate {
    func delBtnClick(cell : DelegateCell )
}

class DelegateCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var delegate : CellDelegate?
    
    var model : Model? {
        didSet{
            if let model = model {
                titleLabel.text = model.title
            }
        }
    }
    
    @IBAction func delClick(sender: UIButton) {
        delegate?.delBtnClick(self)
    }
    
}
