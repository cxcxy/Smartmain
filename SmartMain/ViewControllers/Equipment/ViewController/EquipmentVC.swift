//
//  EquipmentVC.swift
//  SmartMain
//
//  Created by mac on 2018/9/4.
//  Copyright © 2018年 上海际浩智能科技有限公司（InfiniSmart）. All rights reserved.
//

import UIKit

class EquipmentVC: XBBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的设备"
        makeItemNavRight()
        tableView.cellId_register("EquipmentListCell")
    }
    func makeItemNavRight()  {
        //MARK: 点击添加商家
        makeCustomerImageNavigationItem("icon_tianjia", left: false) {
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
extension EquipmentVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 310
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return EquipmentTopView.loadFromNib()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EquipmentListCell", for: indexPath) as! EquipmentListCell
        
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
    VCRouter.toEquipmentSettingVC()
    }
    
}
