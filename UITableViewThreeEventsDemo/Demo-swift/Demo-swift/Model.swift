//
//  Model.swift
//  Demo-20160418
//
//  Created by crw on 4/19/16.
//  Copyright © 2016 crw. All rights reserved.
//


class Model {
    
    var title : String
 
    init(title : String) {
        self.title = title
    }
    
    class func getData() -> [Model] {
        var dataArray = [Model]()
        for index in 0 ... 10 {
            let model = Model.init(title: "title->\(index)")
            dataArray.append(model)
        }
        return dataArray
    }
}
