//
//  ViewController.swift
//  teratail_41673
//
//  Created by KentarOu on 2016/07/21.
//  Copyright © 2016年 KentarOu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var timer:NSTimer = NSTimer()
    var dataArray = DataModel().createData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if !timer.valid {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.updateCustomCellLabel(_:)), userInfo: nil, repeats: true)
            NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        timer.invalidate()
    }
    
    func updateCustomCellLabel(timer: NSTimer) {
        // 表示中のセル一覧を取得
        let visibleCells = tableView.visibleCells as! [CustomCell]
        for cell in visibleCells {
            // セルに対してラベルのアップデートメソッドを呼び出す
            cell.updateLabel()
        }
    }
    
    // MARK: - TableView Delegate & DataSource
    
    // Row Count
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    // Generate Cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
        cell.data = dataArray[indexPath.row]
        return cell
    }
    
    // Select Cell
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        print("Cell Tap - ",indexPath.row)
    }
}