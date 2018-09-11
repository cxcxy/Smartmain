//
//  LikeViewController.swift
//  SmartMain
//
//  Created by mac on 2018/9/4.
//  Copyright © 2018年 上海际浩智能科技有限公司（InfiniSmart）. All rights reserved.
//

import UIKit

class LikeViewController: XBBaseTableViewController {
    var dataArr: [ConetentLikeModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentNavigationTitleColor = UIColor.black
        tableView.cellId_register("ContentSingCell")
        self.cofigMJRefresh()
    }
    override func setUI() {
        super.setUI()
        request()
    }
    override func request() {
        super.request()
        guard let phone = user_defaults.get(for: .userName) else {
            XBHud.showMsg("请登录")
            return
        }
        Net.requestWithTarget(.getLikeList(openId: phone), successClosure: { (result, code, message) in
            print(result)
            if let arr = Mapper<ConetentLikeModel>().mapArray(JSONString: result as! String) {
                if self.pageIndex == 1 {
                    self.dataArr.removeAll()
                }
                self.dataArr += arr
                self.refreshStatus(status: arr.checkRefreshStatus(self.pageIndex))
                self.tableView.reloadData()
            }
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
extension LikeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArr.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentSingCell", for: indexPath) as! ContentSingCell
//        cell.lbTitle.set_text = dataArr[indexPath.row].title
//        cell.lbTime.set_text = XBUtil.getDetailTimeWithTimestamp(timeStamp: dataArr[indexPath.row].duration)
        cell.likeModelData = dataArr[indexPath.row]
        cell.lbLineNumber.set_text = (indexPath.row + 1).toString
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
