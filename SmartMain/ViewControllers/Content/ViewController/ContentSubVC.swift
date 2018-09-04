//
//  ContentSubVC.swift
//  SmartMain
//
//  Created by 陈旭 on 2018/9/4.
//  Copyright © 2018年 上海际浩智能科技有限公司（InfiniSmart）. All rights reserved.
//

import UIKit

class ContentSubVC: XBBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func setUI() {
        super.setUI()
        request()
    }
    override func request() {
        super.request()
        var params_task = [String: Any]()
        params_task["clientId"] = "10110000002003C7"
        params_task["moduleId"] = ""
        params_task["albumId"] = "8"
        params_task["page"] = "1"
        params_task["count"] = "20"
        Net.requestWithTarget(.contentsub(req: params_task), successClosure: { (result, code, message) in
//            let arr = Mapper<ModulesResModel>().mapArray(JSONObject:JSON(result)["modules"].arrayObject)
//            print(arr)
//            if let ar = arr {
//                self.dataArr = ar
//                self.tableView.reloadData()
//            }
            
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
