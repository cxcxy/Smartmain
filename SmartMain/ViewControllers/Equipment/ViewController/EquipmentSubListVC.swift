//
//  ContentSingsVC.swift
//  SmartMain
//
//  Created by mac on 2018/9/5.
//  Copyright © 2018年 上海际浩智能科技有限公司（InfiniSmart）. All rights reserved.
//

import UIKit

class EquipmentSubListVC: XBBaseTableViewController {
    var trackListId: Int! // 列表id
    
    var dataArr: [EquipmentSingModel] = []
    var headerInfo:ConetentSingAlbumModel?
    var total: Int?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func setUI() {
        super.setUI()
        self.registerCells(register_cells: ["ContentSingCell"])
        self.tableView.mj_header = self.mj_header
        self.tableView.mj_footer = self.mj_footer
        request()
        
    }

    override func request() {
        super.request()
        var params_task = [String: Any]()
        params_task["trackListId"] = trackListId
        params_task["currentPage"] = self.pageIndex
        params_task["pageSize"] = XBPageSize
        Net.requestWithTarget(.getTrackSubList(req: params_task), successClosure: { (result, code, message) in
            
            if let arr = Mapper<EquipmentSingModel>().mapArray(JSONObject: JSON.init(parseJSON: result as! String)["tracks"].arrayObject) {
                if self.pageIndex == 1 {
                    self.dataArr.removeAll()
                }
                self.dataArr += arr
                self.total = JSON.init(parseJSON: result as! String)["totalCount"].int
                self.refreshStatus(status: arr.checkRefreshStatus(self.pageIndex))
                self.tableView.reloadData()
            }
           
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
extension EquipmentSubListVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = ContentSingHaderView.loadFromNib()
        if let total = self.total {
            v.lbTotal.set_text = "共" + total.toString + "首"
        }else {
            v.lbTotal.set_text = ""
        }
        return v
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentSingCell", for: indexPath) as! ContentSingCell
        cell.lbTitle.set_text = dataArr[indexPath.row].title
        cell.lbTime.set_text = XBUtil.getDetailTimeWithTimestamp(timeStamp: dataArr[indexPath.row].duration)
        cell.lbLineNumber.set_text = (indexPath.row + 1).toString
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        XBHud.showMsg("点击了")
    }
    
}


