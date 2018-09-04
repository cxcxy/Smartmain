//
//  EquipmentSettingVC.swift
//  SmartMain
//
//  Created by 陈旭 on 2018/9/4.
//  Copyright © 2018年 上海际浩智能科技有限公司（InfiniSmart）. All rights reserved.
//

import UIKit

class EquipmentSettingVC: XBBaseTableViewController {
    var sourceArr : [String] = ["设备信息","修改网络","解绑设备","成员管理","使用说明"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func setUI() {
        super.setUI()
        self.title = "设备设置"
        tableView.cellId_register("EquipmentListCell")
        tableView.cellId_register("EquipmentSetHeaderCell")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension EquipmentSettingVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "EquipmentSetHeaderCell", for: indexPath) as! EquipmentSetHeaderCell
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "EquipmentListCell", for: indexPath) as! EquipmentListCell
        cell.lbTitle.text = sourceArr[indexPath.row - 1]
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            VCRouter.toEquipmentInfoVC()
        default:
            break
        }
    }
    
}
