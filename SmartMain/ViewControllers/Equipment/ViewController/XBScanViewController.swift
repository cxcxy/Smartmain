//
//  XBScanViewController.swift
//  XBPMDev
//
//  Created by mac on 2018/4/19.
//  Copyright © 2018年 mac-cx. All rights reserved.
//

import UIKit
enum XBScanEntrance {
    case main               // 主页扫一扫
    case transfer           // 划转扫一扫
    case AccountGive        // 发放扫一扫
    case exchange           // 兑换扫一扫
}
//typealias XBScanResultBlock = (_ friendModelArr: [FriendResModel]?,_ companyModel: XBCompDetResModel?,_ voucherModel: VoucherListResModel?) -> ()
class XBScanViewController: XBBaseViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var sessionManager:AVCaptureSessionManager?
    var link: CADisplayLink?
    var torchState = false
//    var viewModel: CenterViewModel = CenterViewModel()
//    var block: XBScanResultBlock?
    var entarnceType: XBScanEntrance = .main
    
    @IBOutlet weak var scanTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        link = CADisplayLink(target: self, selector: #selector(scan))
        title = "扫描二维码"
        
        self.currentNavigationNone = true
        self.currentNavigationTitleColor = UIColor.white
        sessionManager = AVCaptureSessionManager(captureType: .AVCaptureTypeBoth, scanRect: CGRect.null, success: { (result) in
            if let r = result {
                self.showResult(result: r)
            }
        })
        sessionManager?.showPreViewLayerIn(view: view)
        sessionManager?.isPlaySound = true
        
//        let item = UIBarButtonItem(title: "相册", style: .plain, target: self, action: #selector(openPhotoLib))
//        navigationItem.rightBarButtonItem = item
        makeCustomerNavigationItem("相册", left: false) {[weak self] in
            self?.openPhotoLib()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        link?.add(to: RunLoop.main, forMode: RunLoopMode.commonModes)
        sessionManager?.start()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        link?.remove(from: RunLoop.main, forMode: RunLoopMode.commonModes)
        sessionManager?.stop()
    }
    
    @objc func scan() {
        scanTop.constant -= 1;
        if (scanTop.constant <= -170) {
            scanTop.constant = 170;
        }
    }
    
    @IBAction func changeState(_ sender: UIButton) {
        torchState = !torchState
        let str = torchState ? "关闭闪光灯" : "开启闪光灯"
        sessionManager?.turnTorch(state: torchState)
        sender.setTitle(str, for: .normal)
    }
    
    

    
    @objc func openPhotoLib() {
        AVCaptureSessionManager.checkAuthorizationStatusForPhotoLibrary(grant: {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }) {
            let action = UIAlertAction(title: "确定", style: UIAlertActionStyle.default, handler: { (action) in
                let url = URL(string: UIApplicationOpenSettingsURLString)
                UIApplication.shared.openURL(url!)
            })
            let con = UIAlertController(title: "权限未开启",
                                        message: "您未开启相册权限，点击确定跳转至系统设置开启",
                                        preferredStyle: UIAlertControllerStyle.alert)
            con.addAction(action)
            self.present(con, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        sessionManager?.start()
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true) {
            self.sessionManager?.start()
            self.sessionManager?.scanPhoto(image: info["UIImagePickerControllerOriginalImage"] as! UIImage, success: { (str) in
                print(str)
                if let result = str {

                    self.showResult(result: result)

                }else {
                    self.showResult(result: "未识别到二维码")
                }
            })
            
        }
    }

}
extension XBScanViewController {
    
    func showResult(result: String) {
        let arr = result.components(separatedBy: "#")

        var params_task = [String: Any]()
        params_task["openId"] = user_defaults.get(for: .userName)
        if arr.count > 1 {
            params_task["deviceId"] = testDeviceId
        }
        
        Net.requestWithTarget(.joinEquiment(req: params_task), successClosure: { (result, code, message) in
            print(result)
            if let str = result as? String {
                if str == "ok" {
                    print("加入成功")
                    self.requestJoinEaseGroup(username: user_defaults.get(for: .userName), deviceId: arr[1])
                }else {
                    XBHud.showMsg("第一步加入失败")
                }
            }
        })

    }
    
    func requestJoinEaseGroup(username: String?,deviceId:String?)  {
        var params_task = [String: Any]()
        
        params_task["username"] = username
        params_task["deviceId"] = deviceId

        Net.requestWithTarget(.joinEquimentGroup(req: params_task), successClosure: { (result, code, message) in
            print(result)
            if let str = result as? String {
                if str == "ok" {
                    print("加入成功")
                    user_defaults.set(deviceId, for: .deviceId)
                    XBHud.showMsg("加入成功")
                }else {
                    XBHud.showMsg("第二步加入失败")
                }
            }
        })
        //发放优惠卷接口
//        XBNetManager.shared.requestWithTarget(.api_accountPutin(req: ["verificationCode": verificationCode]), successClosure: { (result, code, message) in
//
//        })
        
    }
  
    //MARK:  拿到二维码扫描出来的结果，获取相应的数据
    func requestData(biztype : Int,
                     param : String)  {
//        let req_model = QrcodeScanReqModel()
//        req_model.biztype   = biztype
//        req_model.param     = param
//
//
//        viewModel.requestQrcodeScan(m: req_model, closure: { [weak self]  (userModel, companyModel,voucherTicketModel) in
//            guard let `self` = self else { return }
//
//            if let userModel = userModel {
//                self.getUserModelData(userModel: userModel)
//            }
//            if let companyModel = companyModel {
//                self.getCompanyModelData(companyModel: companyModel)
//
//            }
//            if let voucherTicketModel = voucherTicketModel {
//                self.getVoucherTicketModelData(bizdata: param,voucherModel: voucherTicketModel)
//            }
//        }) { [weak self](errorMessage) in
//            guard let `self` = self else { return }
//            XBDelay.start(delay: 2.0, closure: {
//                 self.sessionManager?.start()
//            })
//
//        }
    }
    
    //MARK: 获取用户数据
    func getUserModelData(userModel: XBUserModel) {
//        if entarnceType == .main {
//            VCRouter.toPersonHomeVC(xbUserModel: userModel, entranceType: .qrscan)
//            return
//        }
//        let frendsmodel         = FriendResModel.init()
//        frendsmodel.userid      = userModel.userid
//        frendsmodel.accountId   = userModel.accountId
//        frendsmodel.dispname    = userModel.dispname
//
//        if let blcok = self.block {
//             blcok([frendsmodel],nil,nil)
//            self.popVC()
//        }
    }
//    //MARK: 获取公司详情
//    func getCompanyModelData(companyModel: XBCompDetResModel) {
//        if entarnceType == .main {
//            VCRouter.toMerchantDetailQRCodeVC(companyDetail: companyModel)
//            return
//        }
//        if let blcok = self.block {
//           blcok(nil, companyModel,nil)
//            self.popVC()
//        }
//    }
//    //MARK: 获取体验劵详情
//    func getVoucherTicketModelData(bizdata: String,voucherModel: VoucherListResModel) {
//        if entarnceType == .main {
//            VCRouter.toExperTicketVCWithQRCode(param: bizdata,voucherModel: voucherModel)
//            return
//        }
//        if let blcok = self.block {
//            blcok(nil,nil,voucherModel)
//            self.popVC()
//        }
//    }
}
