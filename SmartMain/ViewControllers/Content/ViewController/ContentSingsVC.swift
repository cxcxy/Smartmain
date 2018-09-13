//
//  ContentSingsVC.swift
//  SmartMain
//
//  Created by mac on 2018/9/5.
//  Copyright © 2018年 上海际浩智能科技有限公司（InfiniSmart）. All rights reserved.
//

import UIKit

class ContentSingsVC: XBBaseViewController {
    var clientId: String!
    var albumId: String!
    var dataArr: [ConetentSingModel] = []
    var headerInfo:ConetentSingAlbumModel?
    @IBOutlet weak var lbTopDes: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgTop: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentNavigationNone = true
    }
    override func setUI() {
        super.setUI()
        self.configTableView(tableView, register_cell: ["ContentSingCell"])
        self.tableView.mj_header = self.mj_header
        self.tableView.mj_footer = self.mj_footer
        request()
        
    }
    func configTopHeadeaInfp(model: ConetentSingAlbumModel!)  {
        self.headerInfo = model
        lbTopDes.set_text = model.name
        imgTop.set_Img_Url(model.imgLarge)
    }
    override func request() {
        super.request()
        var params_task = [String: Any]()
        params_task["clientId"] = clientId
        params_task["albumId"] = albumId
        params_task["page"] = self.pageIndex
        params_task["count"] = XBPageSize
        Net.requestWithTarget(.contentsings(req: params_task), successClosure: { (result, code, message) in
            if let arr = Mapper<ConetentSingModel>().mapArray(JSONObject:JSON(result)["list"].arrayObject) {
                if self.pageIndex == 1 {
                    self.dataArr.removeAll()
                }
                self.dataArr += arr
                self.refreshStatus(status: arr.checkRefreshStatus(self.pageIndex))
            }
            if let topModel = Mapper<ConetentSingAlbumModel>().map(JSONObject:JSON(result)["album"].object) {
                self.configTopHeadeaInfp(model: topModel)
            }
             self.tableView.reloadData()
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
extension ContentSingsVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = ContentSingHaderView.loadFromNib()
        if let total = headerInfo?.total {
            v.lbTotal.set_text = "共" + total.toString + "首"
        }else {
            v.lbTotal.set_text = ""
        }
        return v
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentSingCell", for: indexPath) as! ContentSingCell
//        cell.lbTitle.set_text = dataArr[indexPath.row].name
//        cell.lbTime.set_text = XBUtil.getDetailTimeWithTimestamp(timeStamp: dataArr[indexPath.row].length)
        cell.modelData = dataArr[indexPath.row]
        cell.headerInfo = self.headerInfo
        cell.lbLineNumber.set_text = (indexPath.row + 1).toString
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.requestOnlineSing(trackId: dataArr[indexPath.row].resId ?? "")
    }
    func requestOnlineSing(trackId: String)  {
        let arr = trackId.components(separatedBy: ":")
        guard arr.count > 1 else {
            return
        }
        Net.requestWithTarget(.onlineSing(openId: user_defaults.get(for: .userName)!, trackId: arr[1]), successClosure: { (result, code, message) in
            if let str = result as? String {
                if str == "0" {
                    XBHud.showMsg("点播成功")
                }else if str == "1"{
                    XBHud.showMsg("设备不在线")
                }else if str == "2"{
                    XBHud.showMsg("你没有绑定设备")
                }
            }
        })
    }
}
