//
//  LikeViewController.swift
//  SmartMain
//
//  Created by mac on 2018/9/4.
//  Copyright © 2018年 上海际浩智能科技有限公司（InfiniSmart）. All rights reserved.
//

import UIKit

class LikeViewController: XBBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentNavigationTitleColor = UIColor.black
        tableView.cellId_register("ContentLikeCell")
    }
    override func setUI() {
        super.setUI()
        request()
    }
    override func request() {
        super.request()
        Net.requestWithTarget(.getLikeList(openId: "17621969367"), successClosure: { (result, code, message) in
            print(result)
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension LikeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentLikeCell", for: indexPath) as! ContentLikeCell
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
