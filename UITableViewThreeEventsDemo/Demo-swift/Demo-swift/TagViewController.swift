//
//  TagViewController.swift
//  Demo-20160418
//
//  Created by crw on 4/20/16.
//  Copyright © 2016 crw. All rights reserved.
//

import UIKit

let ID = "Cell"

class TagViewController: UITableViewController {
    
    var dataArray = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArray = Model.getData()
        
        tableView.reloadData()
    }
    
}

extension TagViewController
{

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(ID, forIndexPath: indexPath) as! Cell
        cell.model = dataArray[indexPath.row]
        cell.delBtn.addTarget(self, action:#selector(deleteItem(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        cell.delBtn.tag = indexPath.row
        return cell
    }
    
    //没有删除动画,正常运行
    func deleteItem(btn : UIButton) {
        
        let index = btn.tag;
        
        dataArray.removeAtIndex(index)
        tableView.reloadData()
    }
    
//    //第一次可以正常，后续会出错，有删除动画,不会crash
//    func deleteItem(btn : UIButton) {
//        
//        let index = btn.tag;
//        
//        if (index < self.dataArray.count) {
//            dataArray.removeAtIndex(index)
//            tableView.deleteRowsAtIndexPaths([NSIndexPath.init(forRow: index, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Fade)
//        }else{
//            print(" ");
//            print("－－－－越界－－－－")
//            print("当前index -> \(index)")
//            print("array count -> \(dataArray.count)")
//        }
//    }
    
//    //第一次可以正常，后续会出错，有删除动画,会crash
//    func deleteItem(btn : UIButton) {
//        
//        let index = btn.tag;
//        
//        dataArray.removeAtIndex(index)
//        tableView.deleteRowsAtIndexPaths([NSIndexPath.init(forRow: index, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Fade)
//    }
    
}
