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
//    var mqttSession: MQTTSession!
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
//            VCRouter.qrCodeScanVC()
            self.testRequst()
        }
    }
    func testRequst()  {
        var request = URLRequest(url: URL.init(string: "https://zbtest.wechat.athenamuses.cn/zbtest/resource/appInterface.do?inter=/cms/categories")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let values = ["albumId": "7680",
                      "page":1,
                      "clientId":15] as [String : Any]
//        {"albumId": "7680","page": 1,"clientId": "","count": 15}
        
        let data = try! JSONSerialization.data(withJSONObject: values, options: [])
//        JSONSerialization.data(withJSONObject: <#T##Any#>, options: <#T##JSONSerialization.WritingOptions#>)
        print(data)
        request.httpBody = data
        
        //        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        
        //        JSONSerialization.data(withJSONObject: values, options: .prettyPrinted)
        Alamofire.request(request).responseJSON { (response) in
            switch response.result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
    override func setUI() {
        super.setUI()
        self.cofigMjHeader()
        request()
//
        _ = Noti(.refreshEquipmentInfo).takeUntil(self.rx.deallocated).subscribe(onNext: {[weak self] (value) in
            guard let `self` = self else { return }
            self.request()
        })
//        self.establishConnection()
    }
   
    override func request() {
        super.request()
        guard XBUserManager.device_Id != "" else {
            endRefresh()
            return
        }
        Net.requestWithTarget(.getTrackList(deviceId: XBUserManager.device_Id), successClosure: { (result, code, message) in
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
        
        return dataArr.count == 0 ? XBMin : 310
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = EquipmentTopView.loadFromNib()
        v.addTapGesture { (sender) in
            VCRouter.toEquipmentSettingVC()
        }
        return dataArr.count == 0 ? nil : v
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EquipmentListCell", for: indexPath) as! EquipmentListCell
        cell.lbTitle.set_text = dataArr[indexPath.row].name
        let trackCount = dataArr[indexPath.row].trackCount ?? 0
        cell.lbNumber.set_text = "共" + trackCount.toString + "首"
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        VCRouter.toEquipmentSubListVC(trackListId: dataArr[indexPath.row].id ?? 0,navTitle: dataArr[indexPath.row].name)
    }
    override func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
      return  NSAttributedString(string: "暂无绑定设备",
                           attributes:[NSAttributedStringKey.foregroundColor:MGRgb(25, g: 28, b: 39),
                                       NSAttributedStringKey.font:UIFont.systemFont(ofSize: 17)])

    }
    
}
