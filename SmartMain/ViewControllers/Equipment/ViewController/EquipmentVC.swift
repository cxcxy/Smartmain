//
//  EquipmentVC.swift
//  SmartMain
//
//  Created by mac on 2018/9/4.
//  Copyright © 2018年 上海际浩智能科技有限公司（InfiniSmart）. All rights reserved.
//

import UIKit

class EquipmentVC: XBBaseTableViewController {
    var dataArr: [EquipmentModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的设备"
        makeItemNavRight()
        self.currentNavigationColor = MGRgb(0, g: 145, b: 222)
        self.currentNavigationTitleColor = UIColor.white
        tableView.cellId_register("EquipmentListCell")
    }
    func makeItemNavRight()  {
        //MARK: 点击添加商家
        makeCustomerImageNavigationItem("icon_tianjia", left: false) {
            VCRouter.qrCodeScanVC()
        }
    }
    override func setUI() {
        super.setUI()
        self.cofigMjHeader()
        request()
        
    }
    override func request() {
        super.request()
        Net.requestWithTarget(.getTrackList(deviceId: testDeviceId), successClosure: { (result, code, message) in
            print(result)
            if let arr = Mapper<EquipmentModel>().mapArray(JSONString: result as! String) {
                self.endRefresh()
                self.dataArr = arr
                self.tableView.reloadData()
            }
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
extension EquipmentVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArr.count
        
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 310
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return EquipmentTopView.loadFromNib()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EquipmentListCell", for: indexPath) as! EquipmentListCell
        cell.lbTitle.set_text = dataArr[indexPath.row].name
        let trackCount = dataArr[indexPath.row].trackCount ?? 0
        cell.lbNumber.set_text = "共" + trackCount.toString + "首"
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
//    VCRouter.toEquipmentSettingVC()
//        let vc = LoginViewController()
//        self.pushVC(vc)
        if indexPath.row == 0 {
            VCRouter.toEquipmentSettingVC()
            return
        }
        if indexPath.row == 1 {
            let vc = LoginViewController()
            self.pushVC(vc)
            return
        }
        VCRouter.toEquipmentSubListVC(trackListId: dataArr[indexPath.row].id ?? 0,navTitle: dataArr[indexPath.row].name)
    }
    
    
}
