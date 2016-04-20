//
//  CellSuperViewController.swift
//  Demo-20160418
//
//  Created by crw on 4/20/16.
//  Copyright © 2016 crw. All rights reserved.
//

import UIKit

class CellSuperViewController: UITableViewController {
    
    var dataArray = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArray = Model.getData()
        
        tableView.reloadData()
    }
    
}

extension CellSuperViewController
{
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ID, forIndexPath: indexPath) as! Cell
        cell.model = dataArray[indexPath.row]
        cell.delBtn.addTarget(self, action:#selector(deleteItem(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        return cell
    }
    
    func deleteItem(btn : UIButton) {
        
        var view : UIView = btn;
        
        while (!view.isKindOfClass(UITableViewCell.self)) {
            view = view.superview!;
        }
        
        let cell = view as! Cell;
        
        if let indexPath = tableView.indexPathForCell(cell) {
            dataArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
}