////
////  UIViewControllerRouter.swift
////  BSMaster
////
////  Created by 陈旭 on 2017/10/9.
////  Copyright © 2017年 陈旭. All rights reserved.
////
//
//typealias XBClickSureAction         = () -> ()
////MARK:  统一路由页面的管理
//class VCRouter {
//    /**
//     *  获取栈顶部 导航条
//     */
//    class var topNaVC : UINavigationController? {
//        
//        get {
//            let topViewController = XBUtil.currentTopViewController()
//            let navigation = topViewController.navigationController
//            return navigation
//        }
//    }
//    /**
//     *  获取栈顶部 导航条控制器
//     */
//     class var topVC : UIViewController? {
//        
//        get {
//            let topViewController = XBUtil.currentTopViewController()
//            return topViewController
//        }
//    }
//    /**
//     * 回到首页
//     */
//    class func toMainVC() {
//        
//        topVC?.popToRootVC()
//        topVC?.tabBarController?.selectedIndex = 1
//    }
//    /**
//     * 跳转登录页面管理
//     */
//    class func toLoginWarningVC() {
//        if XBLoginShow == 1 {
//            return
//        }
//        
//        XBNetManager.shared.cancelAllRequest()
//        DispatchQueue.main.async {
//            VCRouter.toMainVC()
//            let v = XBLoginWarningView.loadFromNib()
//            v.show()
//        }
//    }
//    /**
//     * 跳转登录页面管理
//     */
//    class func toLoginVC() {
//        if (UIApplication.currentViewController()?.className  == XBLoginController.className){
//            return
//        }
////        XBHud.dismiss()
//        XBUserManager.cleanUserInfo()
//        DispatchQueue.main.async {
//
//            let  vc  = XBLoginController()
//            let nav = XBBaseNavigation.init(rootViewController: vc)
//            topVC?.presentVC(nav)
//        }
//    }
//    /**
//     *  跳转商家主页
//     */
//    class func toMerchantDetailVC(companyid: Int,companyDetail: XBCompDetResModel? = nil)  {
//        
//        let vc = XBMerchantsDetailVC.init(style: .grouped)
//        vc.companyid = companyid
//        
//        topVC?.pushVC(vc)
//        
//    }
//    /**
//     *  跳转商家主页 - 二维码
//     */
//    class func toMerchantDetailQRCodeVC(companyDetail: XBCompDetResModel)  {
//        
//        let vc = XBMerchantsDetailVC.init(style: .grouped)
//        vc.modelData = companyDetail
//        vc.entranceType = .qrscan
//        topVC?.pushVC(vc)
//        
//    }
//    /**
//     *  跳转个人设置页面
//     */
//    class func toMySettingVC()  {
//        
//        let vc =  XBSettingViewController()
//        vc.currentNavigationColor = MGRgb(105, g: 107, b: 128)
//        topVC?.pushVC(vc)
//        
//    }
//    /**
//     *  跳转个人资料页面
//     */
//    class func toUserDataVC()  {
//        
//        let vc =  XBUserDataVC()
// 
//        topVC?.pushVC(vc)
//        
//    }
//    /**
//     *  跳转编辑页面
//     */
////    var area_str: String        = ""
////    var address_str : String    = ""
//    class func toEditAddressVC(_ type: XBEditAddressType = .address,
//                               area_str: String = "",
//                               address_str: String = "",
//                               block: EditAddressBlock? = nil)  {
//        
//        let vc =  XBEditAddressVC()
//        vc.type = type
//        if let block = block {
//            vc.editAddressBlock = block
//        }
//        vc.address_str = address_str
//        vc.area_str = area_str
//        topVC?.pushVC(vc)
//        
//    }
//    
//    /**
//     *  跳转个人账户页面
//     */
//    class func toAccountDetVC(accountId: String? = nil, compDetResModel : XBCompDetResModel? = nil, type:XBAccountDetType = .businessCenter)  {
//
//        let vc =  XBAccountDetVC()
//        if let accountId = accountId {
//            vc.accountId = accountId
//        }
//        if let compDetResModel = compDetResModel {
//            vc.compDetResModel = compDetResModel
//        }
//        vc.type = type
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转卡券中心页面
//     */
//    class func toCardCouponVC(companyId: Int? = nil,
//                              convertAmount: Double? = nil,
//                              selectArray: [VoucherListResModel]? = nil,
//                              type:XBCardCouponType = .cardCouponHome,
//                              entranceType: XBQRScanEntranceType = .none,
//                              cardCouponBlock: XBCardCouponBlock? = nil)  {
//        
//        let vc =  XBCardCouponVC()
//        if let companyId = companyId {
//            vc.companyId = companyId
//        }
//        if let convertAmount = convertAmount {
//            vc.convertAmount = convertAmount
//        }
//        if let array = selectArray {
//            vc.selectIndexArray = array
//        }
//        vc.entranceType = entranceType
//        vc.type = type
//        if let cardCouponBlock = cardCouponBlock {
//            vc.cardCouponBlock = cardCouponBlock
//        }
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转体验券页面
//     */
//    class func toExperTicketVC(voucherModel: VoucherListResModel? = nil, type:XBTicketDetailType = .ticketDetExperi)  {
//        
//        let vc =  XBTicketDetailVC()
//        if let voucherModel = voucherModel {
//            vc.voucherModel = voucherModel
//        }
//        vc.type = type
//        vc.entranceType = .none
//
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转体验券页面---由二维码扫一扫进入
//     */
//    class func toExperTicketVCWithQRCode(param: String,
//                                         voucherModel:VoucherListResModel)  {
//        
//        let vc =  XBTicketDetailVC()
//        vc.voucherModel = voucherModel
//        vc.param_qr     = param
//        vc.entranceType = .qrscan
//        vc.type = .ticketDetExperi
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转消息页面
//     */
//    class func toMessageListVC()  {
//        if (UIApplication.currentViewController()?.className  == XBMessageListVC.className){
//            return
//        }
//        let vc  = XBMessageListVC.init(style: .grouped)
//
//        topVC?.pushVC(vc)
//    }
//    /**
//     * 跳转系统消息
//     */
//    class func toSystemsMessageVC(_ noticeModel: XBMessageResModel) {
//        let  vc  = XBSystemMsgVC.init(style: .grouped)
//        vc.beforeDataModel          = noticeModel
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转兑换服务页面
//     */
//    class func toConvertServiceVC(toAccountid: String? = nil, shortName: String? = nil, voucherModelArr: [VoucherListResModel]? = nil, type: XBConvertServiceType = .convertNone, fromType: XBConvertFromToType = .centerMainTo)  {
//        
//        let vc =  XBConvertServiceVC()
//        if let toAccountid = toAccountid {
//            vc.toAccountid = toAccountid
//        }
//        if let shortName = shortName {
//            vc.shortName = shortName
//        }
//        if let voucherModelArr = voucherModelArr {
//            vc.voucherModelArr = voucherModelArr
//        }
//        vc.type = type
//        vc.fromType = fromType
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转选择商家页面
//     */
//    class func toBusinessListVC(businessListBlock: XBBusinessListBlock? = nil)  {
//        
//        let vc =  XBBusinessListVC()
//        if let businessListBlock = businessListBlock {
//            vc.businessListBlock = businessListBlock
//        }
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转我的商家页面
//     */
//    class func toMyBusinessVC(myCompanyArr: [CompanyListResModel]? = nil)  {
//        
//        let vc =  XBMyBusinessVC()
//        if let myCompanyArr = myCompanyArr {
//            vc.myCompanyArr = myCompanyArr
//        }
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转商家管理页面
//     */
//    class func toBusinessManVC(compDetResModel: XBCompDetResModel? = nil, type: XBBusinessManType = .normalTo)  {
//        
//        let vc =  XBBusinessManVC()
//        if let compDetResModel = compDetResModel {
//            vc.compDetResModel = compDetResModel
//        }
//        vc.type = type
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转发放页面
//     */
//    class func toAccountGiveVC(accountModel : AccountDetResModel? = nil, compDetResModel : XBCompDetResModel? = nil)  {
//
//        let vc =  XBAccountGiveVC()
//        if let accountModel = accountModel {
//            vc.accountModel = accountModel
//        }
//        if let compDetResModel = compDetResModel {
//            vc.compDetResModel = compDetResModel
//        }
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转流通设置页面
//     */
//    class func toCirculateSetVC(isTransfer : Int? = nil, circulateSetBlock : XBCirculateSetBlock? = nil)  {
//        
//        let vc =  XBCirculateSetVC()
//        if let isTransfer = isTransfer {
//            vc.isTransfer = isTransfer
//        }
//        if let circulateSetBlock = circulateSetBlock {
//            vc.circulateSetBlock = circulateSetBlock
//        }
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转上传凭证页面
//     */
//    class func toFirstUploadCerVC(compDetResModel: XBCompDetResModel? = nil)  {
//        
//        let vc =  XBFirstUploadCerVC()
//        if let compDetResModel = compDetResModel {
//            vc.compDetResModel = compDetResModel
//        }
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转兑换服务设置页面
//     */
//    class func toConvertSerSetVC(compDetResModel: XBCompDetResModel? = nil)  {
//        
//        let vc =  XBConvertSerSetVC()
//        if let compDetResModel = compDetResModel {
//            vc.compDetResModel = compDetResModel
//        }
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转商家管理员页面
//     */
//    class func toBusinessAdminVC(compDetResModel: XBCompDetResModel? = nil)  {
//        
//        let vc =  XBBusinessAdminVC()
//        if let compDetResModel = compDetResModel {
//            vc.compDetResModel = compDetResModel
//        }
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转管理员变更页面
//     */
//    class func toAdminChangeVC(voucherTicketId : Int? = nil,
//                               compDetResModel: XBCompDetResModel? = nil,
//                               type:XBAddPhoneType = .changeAdmin,
//                               backIndex: Int? = nil,
//                               phoneBlock: XBAddPhoneBlock? = nil)  {
//        
//        let vc =  XBAddChanPhoneVC()
//        if let voucherTicketId = voucherTicketId {
//            vc.voucherTicketId = voucherTicketId
//        }
//        if let compDetResModel = compDetResModel {
//            vc.compDetResModel = compDetResModel
//        }
//        vc.type = type
//        if let backIndex = backIndex {
//            vc.backIndex = backIndex
//        }
//        if let block = phoneBlock {
//            vc.phoneBlock = block
//        }
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转好友列表页面
//     */
//    class func toBaseContactsVC(type:XBBaseContactsType = .mineFriends,
//                                isHiddenInvitation: Bool? = nil,
//                                selectArray: [FriendResModel]? = nil,
//                                contactsBlock: XBBaseContactsBlock? = nil)  {
//        
//        let vc =  XBBaseContactsVC()
//        vc.type = type
//        if let isHidden = isHiddenInvitation {
//            vc.isHiddenInvitation = isHidden
//        }
//        if let block = contactsBlock {
//            vc.contactsBlock = block
//        }
//        if let array = selectArray {
//            vc.selectIndexArray = array
//        }
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转手机通讯录页面
//     */
//    class func toMobileDirectory()  {
//        
//        let vc =  XBIphoneDirectoryVC()
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转授权人页面
//     */
//    class func toAuthorizerListVC(companyid : Int? = nil)  {
//        
//        let vc =  XBAuthorizerListVC()
//        if let companyid = companyid {
//            vc.companyid = companyid
//        }
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转授权人添加页面
//     */
//    class func toAuthorizerAddVC(companyid : Int? = nil, authorizerAddBlock: XBAuthorizerAddBlock? = nil)  {
//        
//        let vc =  XBAuthorizerAddVC()
//        if let companyid = companyid {
//            vc.companyid = companyid
//        }
//        if let block = authorizerAddBlock {
//            vc.authorizerAddBlock = block
//        }
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转授权人主页页面
//     */
//    class func toAuthorizerHomeVC(companyid : Int? = nil,
//                                  authorListModel : AuthorListResModel? = nil,
//                                  homeType: XBPersonHomeType = .autuHome,
//                                  authorizerHomeBlock: XBAuthorizerHomeBlock? = nil)  {
//        
//        let vc =  XBAuthorizerHomeVC()
//        if let companyid = companyid {
//            vc.companyid = companyid
//        }
//        if let authorListModel = authorListModel {
//            vc.authorListModel = authorListModel
//        }
//        if let block = authorizerHomeBlock {
//            vc.authorizerHomeBlock = block
//        }
//        vc.personHomeType = homeType
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳个人主页页面 -- 由二维码扫描进入
//     */
//    class func toPersonHomeVC(xbUserModel: XBUserModel? = nil, friendResModel: FriendResModel? = nil, entranceType: XBQRScanEntranceType = .qrscan)  {
//        
//        let vc =  XBAuthorizerHomeVC()
//        if let xbUserModel = xbUserModel {
//            vc.xbUserModel = xbUserModel
//        }
//        if let friendResModel = friendResModel {
//            vc.friendResModel = friendResModel
//        }
//        vc.personHomeType   = .personHome
//        vc.entranceType     = entranceType
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转添加商家页面
//     */
//    class func toAddBusinessVC(type: XBBusinessManType = .normalTo)  {
//        
//        let vc =  XBAddBusinessVC()
//        vc.type = type
//        topVC?.pushVC(vc)
//    }
//    /**
//     *  跳转身份认证页面
//     */
//    class func toUserAuthVC()  {
//        
//        let vc =  XBUserAuthVC.init(style: .grouped)
//        
//        topVC?.pushVC(vc)
//        
//    }
//    /**
//     *  跳转密码管理页面
//     */
//    class func toPasswordSetVC()  {
//        
//        let vc =  XBPasswordSetController.init(style: .grouped)
//        
//        topVC?.pushVC(vc)
//        
//    }
//    /**
//     *  跳转设置安全密钥 .set = 设置， .reset 重置
//     */
//    class func toSetSafeKeyVC(setType: XBSetSafeKeyType = .forget,
//                              entranceType: XBSetEntranceType = .setPassword)  {
//
//        
//        let vc =  XBSetSafeKeyVC()
//        vc.setType = setType
//        vc.entranceType = entranceType
//
//        topVC?.pushVC(vc)
//        
//    }
//    /**
//     *  跳转更改手机号
//     */
//    class func toChangePhoneVC()  {
//        
//        let vc =  XBChangePhoneVC()
//        
//        topVC?.pushVC(vc)
//        
//    }
//    /**
//     *  跳转指导经理人
//     */
//    class func toGuidanceVC()  {
//        
//        let vc =  XBGuidanceVC()
//        
//        topVC?.pushVC(vc)
//        
//    }
//    /**
//     *  跳转更多页面
//     */
//    class func toMoreVC()  {
//        
//        let vc =  XBMoreController()
//        
//        topVC?.pushVC(vc)
//        
//    }
//    
//    /**
//     *  跳转邀请页面
//     */
//    class func toInvitationVC()  {
//        
//        let vc =  XBInvitationVC.init(style: .grouped)
//      
//        topVC?.pushVC(vc)
//        
//    }
//    /**
//     *  跳转划转页面
//     */
//    class func toAccountTransferVC(toAccountid: String? = nil)  {
//        
//        let vc =  XBAccountTransVC()
//        if let toAccountid = toAccountid {
//            vc.toAccountid = toAccountid
//        }
//        topVC?.pushVC(vc)
//        
//    }
//
//    /**
//     *  跳转评价页面
//     */
//    class func toScoreStarsVC(transactionOrderId: Int?,toAccountid: String?, type:XBScoreStarsType = .normalTo)  {
//        
//        let vc =  XBScoreStarsVC()
//        vc.transactionOrderId = transactionOrderId
//        vc.toAccountid = toAccountid
//        vc.type = type
//        topVC?.pushVC(vc)
//        
//    }
//    /**
//     *  跳转发放详情
//     */
//    class func toMsgGiveDetVC(voucherid: Int?)  {
//        
//        let vc =  XBMsgGiveDetVC()
//        vc.voucherid = voucherid
//        topVC?.pushVC(vc)
//        
//    }
//    
//    // MARK: - 弹出选择器视图
//    class func prentShareView(imgCode: UIImage,shareUrl: String) {
//        
//        let vc = XBInvitationViewVC()
//        
////        vc.showPicker(arr: dataArr,index: startIndex)
//        vc.imgCode = imgCode
//        vc.shareUrl = shareUrl
//        let nav = XBBaseNavigation.init(rootViewController: vc)
//        topVC?.presentToMaskViewController(viewControllerToPresent: nav)
//        
//    }
//    // MARK: - 跳转WebView
//    class func toWebView(webUrl: String) {
//        
//        let vc = XBWebViewController()
//        vc.url = webUrl
//        topVC?.pushVC(vc)
//        
//    }
//
//}
//extension VCRouter {
//    
//    
//    class func qrCodeScanVC(entarnceType: XBScanEntrance = .main,scanResultBlock: XBScanResultBlock? = nil) {
//        
//        let scanVC = XBScanViewController()
//        scanVC.entarnceType = entarnceType
//        scanVC.block = scanResultBlock
//        let device = AVCaptureDevice.default(for: .video)
//        if device != nil {
//            let status: AVAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
//            switch status {
//            case .notDetermined:
//                AVCaptureDevice.requestAccess(for: .video, completionHandler: {(_ granted: Bool) -> Void in
//                    if granted {
//                        DispatchQueue.main.sync(execute: {() -> Void in
//                            topVC?.pushVC(scanVC)
//                        })
//                        print("用户第一次同意了访问相机权限 - - \(Thread.current)")
//                    } else {
//                        print("用户第一次拒绝了访问相机权限 - - \(Thread.current)")
//                    }
//                })
//            case .authorized:
//                    topVC?.pushVC(scanVC)
//            case .denied:
//                
//                let alertC = UIAlertController(title: "温馨提示", message: "请去-> [设置 - 隐私 - 相机] 打开访问开关", preferredStyle: .alert)
//                let alertA = UIAlertAction(title: "确定", style: .default, handler: {(_ action: UIAlertAction) -> Void in
//                })
//                alertC.addAction(alertA)
//                topVC?.presentVC(alertC)
//                
//            case .restricted:
//                print("因为系统原因, 无法访问相册")
//
//            }
//            return
//        }
//        let alertC = UIAlertController(title: "温馨提示", message: "未检测到您的摄像头", preferredStyle: .alert)
//        let alertA = UIAlertAction(title: "确定", style: .default, handler: {(_ action: UIAlertAction) -> Void in
//        })
//        alertC.addAction(alertA)
//        topVC?.presentVC(alertC)
//    }
//}
//extension UINavigationController {
//    /**
//     *   push --- 淡入淡出动画
//     */
//    func pushFadeAnimation(viewController: UIViewController) {
//        let transition = CATransition.init()
//        transition.type = kCATransitionFade
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        view.layer.add(transition, forKey: nil)
//        pushViewController(viewController, animated: false)
//    }
//    
//    func popFadeAnimation() {
//        let transition = CATransition.init()
//        transition.type = kCATransitionFade
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        view.layer.add(transition, forKey: nil)
//        popViewController(animated: false)
//    }
//}
