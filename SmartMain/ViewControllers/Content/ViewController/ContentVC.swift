//
//  ContentVC.swift
//  SmartMain
//
//  Created by mac on 2018/9/4.
//  Copyright © 2018年 上海际浩智能科技有限公司（InfiniSmart）. All rights reserved.
//

import UIKit

class ContentVC: XBBaseTableViewController {
    var dataArr: [ModulesResModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentNavigationTitleColor = UIColor.black
        tableView.cellId_register("ContentHeaderCell")
        tableView.cellId_register("ContentShowCell")
        tableView.cellId_register("ContentShowThreeCell")
        tableView.mj_header = self.mj_header
    }
    override func setUI() {
        super.setUI()
        request()
    }
    override func request() {
        super.request()
//        let req_model = ContentReqModel()
//        req_model.appId = "EvXLUN3xtyON74KY"
//        req_model.token = "786203ce01256d1d590e2d0a1c1f11b62076"
//        req_model.clientId = "10110000002003C7"
//        req_model.userId = ""
        var params_task = [String: Any]()
        params_task["clientId"] = "3020040000000028"
        params_task["tags"] = ["six"]

        Net.requestWithTarget(.contentModules(req: params_task), successClosure: { (result, code, message) in
            if let arr = Mapper<ModulesResModel>().mapArray(JSONObject:JSON(result)["modules"].arrayObject) {
                self.endRefresh()
               let filterArr = arr.filter({ (item) -> Bool in
                    if let contents = item.contents {
                        return contents.count > 0
                    }
                    return false
                })
                self.dataArr = filterArr
                self.tableView.reloadData()
            }
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
extension ContentVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArr.count > 6 ? 6 : dataArr.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContentHeaderCell", for: indexPath) as! ContentHeaderCell
            
            return cell
        }
        if indexPath.row == 1 || indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContentShowCell", for: indexPath) as! ContentShowCell
//            cell.collectionDataArr = ["1","2","3","4"]
            cell.dataModel = dataArr[indexPath.row]
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentShowThreeCell", for: indexPath) as! ContentShowThreeCell
//        cell.collectionDataArr = ["1","2","3","4","1","2","3","4","1"]
        cell.dataModel = dataArr[indexPath.row]
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        VCRouter.toContentSubVC()
    }
    
}
