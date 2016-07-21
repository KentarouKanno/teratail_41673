//
//  DataModel.swift
//  teratail_41673
//
//  Created by KentarOu on 2016/07/21.
//  Copyright © 2016年 KentarOu. All rights reserved.
//

import Foundation

struct DataModel {
    var targetData: String = ""
    
    func createData() -> [DataModel] {
        let data1 = DataModel(targetData: "2016/07/21 21:34:40")
        let data2 = DataModel(targetData: "2016/08/11 11:10:10")
        let data3 = DataModel(targetData: "2016/09/01 12:20:45")
        let data4 = DataModel(targetData: "2016/10/21 10:30:14")
        let data5 = DataModel(targetData: "2017/11/11 10:11:12")
        return [data1, data2, data3, data4, data5, data1, data2, data3, data4, data5, data1, data2, data3, data4, data5, data1, data2, data3, data4, data5, data1, data2, data3, data4, data5]
    }
}