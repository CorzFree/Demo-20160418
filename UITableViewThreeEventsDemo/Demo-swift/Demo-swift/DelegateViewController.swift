//
//  DelegateViewController.swift
//  Demo-20160418
//
//  Created by crw on 4/20/16.
//  Copyright © 2016 crw. All rights reserved.
//

import UIKit

let ID2 = "Cell2"

class DelegateViewController: UITableViewController {
    
    var dataArray = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArray = Model.getData()
        
        tableView.reloadData()
    }
    
}

extension DelegateViewController
{
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ID2, forIndexPath: indexPath) as! DelegateCell
        cell.model = dataArray[indexPath.row]
        cell.delegate = self
        return cell
    }
}

extension DelegateViewController : CellDelegate{
    
    func delBtnClick(cell: DelegateCell) {
        if let indexPath = tableView.indexPathForCell(cell) {
            dataArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
}
