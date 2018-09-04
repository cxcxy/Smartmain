//
//  XBUserManager.swift
//  XBShinkansen
//
//  Created by mac on 2017/11/22.
//  Copyright © 2017年 mac. All rights reserved.
//

import UIKit
import ObjectMapper
//MARK: 接受 -- user Model
class XBUserModel:  Mappable{
    var accountId : String? // 账户ID
    var address : String? // 地址
    var authstatus : Int? // 认证状态 1=未认证，2=已认证
    var dispname : String? //显示名称
    var email : String? //邮件
    var isAdmin : Int?//1=管理员
    var isFinance : Int?  // 1=财务管理
    var isMgr : Int?//1=商家管理
    var logourl : String? // 头像
    var nickname : String? // 昵称
    var phone : String? // 手机号
    var profile : String? // 个人简介
    var securityLevel : Int?// 0=未设置支付密码，1=支付密码，2=支付密码+短信验证码（仅当前用户返回）
    var sex : Int?
    var identitycard: String? // 身份正号
//    var sendusername:String? // 实名认证-- 身份证号对应的姓名
    var truename : String? // 真实姓名
    var userid : Int?
    var username : String?
    var area : String?
    var status : Int?
    var totalBalance : Double?//总余额
    var balance : Double?//通用西币余额
    var voucherBalance : Double?//抵用券余额
//    var msgList : [XBMessageResModel]?
//    var friendList : [FriendResModel]?
    var friendCount : Int?

    required init?(map: Map){}
    
    func mapping(map: Map)
    {
        accountId <- map["accountId"]
        address <- map["address"]
        authstatus <- map["authstatus"]
        dispname <- map["dispname"]
        email <- map["email"]
        isAdmin <- map["isAdmin"]
        isFinance <- map["isFinance"]
        isMgr <- map["isMgr"]
        logourl <- map["logourl"]
        nickname <- map["nickname"]
        phone <- map["phone"]
        profile <- map["profile"]
        securityLevel <- map["securityLevel"]
        sex <- map["sex"]
        identitycard <- map["identitycard"]
//        sendusername <- map["sendusername"]
        truename <- map["truename"]
        userid <- map["userid"]
        username <- map["username"]
        area    <- map["area"]
        status  <- map["status"]
        totalBalance    <- map["totalBalance"]
        balance    <- map["balance"]
        voucherBalance    <- map["voucherBalance"]
//        msgList    <- map["msgList"]
//        friendList    <- map["friendList"]
        friendCount    <- map["friendCount"]
    }
    
}
//MARK:登录状态  返回true 时 ，则说明， 未登陆状态
/**
 *   登录状态  返回true 时 ，则说明， 未登陆状态
 */
public func XBLoginStatus() -> Bool{
    
//    if XBTokenManager.accessToken == "" || XBUserManager.dispname == "" || XBUserManager.securitylevel == 0 {
//        XBHud.dismiss()
//        return true
//    }
    
    return false
}

//TODO
struct XBUserManager {
    
    static let XBAuthstatus                         = "XBAuthstatus"          //
    static let XBAccountId                          = "XBAccountId"              //
    static let XBAddress                            = "XBAddress"          //\
    static let XBDispname                           = "XBDispname"            //
    static let XBEmail                              = "XBEmail"               //
    static let XBIsAdmin                           = "XBIsAdmin"
    static let XBIsFinance                          = "XBIsFinance"          //\
    static let XBIsMgr                              = "XBIsMgr"          //
    static let XBLogourl                            = "XBLogourl"             //
    static let XBNickname                           = "XBNickname"            //
    static let XBPhone                              = "XBPhone"               //
    static let XBProfile                            = "XBProfile"
    static let XBSecuritylevel                      = "XBSecuritylevel"               //
    static let XBSex                                = "XBSex"               //
    static let XBTruename                           = "XBTruename"               //
    static let XBUserid                             = "XBUserid"               //
    static let XBUsername                           = "XBUsername"               //
    static let XBArea                               = "XBArea"               //

    static let XBTotalBalance                       = "XBTotalBalance"               //
    static let XBBalance                            = "XBBalance"               //
    static let XBVoucherBalance                     = "XBVoucherBalance"               //
    static let XBFriendCount                        = "XBFriendCount"               //
    
//    static let XBSendusername                        = "XBSendusername"               //
    static let XBIdentitycard                       = "XBIdentitycard"               //
    
    static var accountId:String {
        get{
            return (MGDefault.object(forKey: XBAccountId) as? String) ?? ""
        }
        set{
            MGDefault.set(newValue, forKey:XBAccountId)
            MGDefault.synchronize()
        }
    }
    static var address:String{
        get{
            return (MGDefault.object(forKey: XBAddress) as? String) ?? ""
        }
        set{
            MGDefault.set(newValue, forKey:XBAddress)
            MGDefault.synchronize()
        }
    }
    static var area:String{
        get{
            return (MGDefault.object(forKey: XBArea) as? String) ?? ""
        }
        set{
            MGDefault.set(newValue, forKey:XBArea)
            MGDefault.synchronize()
        }
    }
    static var authstatus:Int {
        get{
            return (MGDefault.object(forKey: XBAuthstatus) as? Int) ?? 0
        }
        set{
            MGDefault.set(newValue, forKey:XBAuthstatus)
            MGDefault.synchronize()
        }
    }

    static var dispname:String {
        get{
            return (MGDefault.object(forKey: XBDispname) as? String) ?? ""
        }
        set{
            MGDefault.set(newValue, forKey:XBDispname)
            MGDefault.synchronize()
        }
        
    }
    
    static var email:String{
        get{
            return (MGDefault.object(forKey: XBEmail) as? String) ?? ""
        }
        set{
            MGDefault.set(newValue, forKey:XBEmail)
            MGDefault.synchronize()
        }
    }
    static var isAdmin:Int {
        get{
            return (MGDefault.object(forKey: XBIsAdmin) as? Int) ?? 0
        }
        set{
            MGDefault.set(newValue, forKey:XBIsAdmin)
            MGDefault.synchronize()
        }
    }
    
    static var isFinance:Int {
        get{
            return (MGDefault.object(forKey: XBIsFinance) as? Int) ?? 0
        }
        set{
            MGDefault.set(newValue, forKey:XBIsFinance)
            MGDefault.synchronize()
        }
    }
    static var isMgr:Int {
        get{
            return (MGDefault.object(forKey: XBIsMgr) as? Int) ?? 0
        }
        set{
            MGDefault.set(newValue, forKey:XBIsMgr)
            MGDefault.synchronize()
        }
    }
    static var logourl:String{
        get{
            return (MGDefault.object(forKey: XBLogourl) as? String) ?? ""
        }
        set{
            MGDefault.set(newValue, forKey:XBLogourl)
            MGDefault.synchronize()
        }
    }
    static var nickname:String{
        get{
            return (MGDefault.object(forKey: XBNickname) as? String) ?? ""
        }
        set{
            MGDefault.set(newValue, forKey:XBNickname)
            MGDefault.synchronize()
        }
    }
    
    static var phone:String{
        get{
            return (MGDefault.object(forKey: XBPhone) as? String) ?? ""
        }
        set{
            MGDefault.set(newValue, forKey:XBPhone)
            MGDefault.synchronize()
        }
    }
    static var profile:String{
        get{
            return (MGDefault.object(forKey: XBProfile) as? String) ?? ""
        }
        set{
            MGDefault.set(newValue, forKey:XBProfile)
            MGDefault.synchronize()
        }
    }
    static var securitylevel:Int{
        get{
            return (MGDefault.object(forKey: XBSecuritylevel) as? Int) ?? 0
        }
        set{
            MGDefault.set(newValue, forKey:XBSecuritylevel)
            MGDefault.synchronize()
        }
    }
    
    static var sex:Int{
        get{
            return (MGDefault.object(forKey: XBSex) as? Int) ?? 0
        }
        set{
            MGDefault.set(newValue, forKey:XBSex)
            MGDefault.synchronize()
        }
    }
//    static var sendusername:String{
//        get{
//            return (MGDefault.object(forKey: XBSendusername) as? String) ?? ""
//        }
//        set{
//            MGDefault.set(newValue, forKey:XBSendusername)
//            MGDefault.synchronize()
//        }
//    }
    static var identitycard:String{
        get{
            return (MGDefault.object(forKey: XBIdentitycard) as? String) ?? ""
        }
        set{
            MGDefault.set(newValue, forKey:XBIdentitycard)
            MGDefault.synchronize()
        }
    }

    static var truename:String{
        get{
            return (MGDefault.object(forKey: XBTruename) as? String) ?? ""
        }
        set{
            MGDefault.set(newValue, forKey:XBTruename)
            MGDefault.synchronize()
        }
    }

    static var userid:Int{
        get{
            return (MGDefault.object(forKey: XBUserid) as? Int) ?? 0
        }
        set{
            MGDefault.set(newValue, forKey:XBUserid)
            MGDefault.synchronize()
        }
    }
    static var username:String{
        get{
            return (MGDefault.object(forKey: XBUsername) as? String) ?? ""
        }
        set{
            MGDefault.set(newValue, forKey:XBUsername)
            MGDefault.synchronize()
        }
    }
    static var totalBalance:Double{
        get{
            return (MGDefault.object(forKey: XBTotalBalance) as? Double) ?? 0
        }
        set{
            MGDefault.set(newValue, forKey:XBTotalBalance)
            MGDefault.synchronize()
        }
    }
    static var balance:Double{
        get{
            return (MGDefault.object(forKey: XBBalance) as? Double) ?? 0
        }
        set{
            MGDefault.set(newValue, forKey:XBBalance)
            MGDefault.synchronize()
        }
    }
    static var voucherBalance:Double{
        get{
            return (MGDefault.object(forKey: XBVoucherBalance) as? Double) ?? 0
        }
        set{
            MGDefault.set(newValue, forKey:XBVoucherBalance)
            MGDefault.synchronize()
        }
    }
    static var friendCount:Int{
        get{
            return (MGDefault.object(forKey: XBFriendCount) as? Int) ?? 0
        }
        set{
            MGDefault.set(newValue, forKey:XBFriendCount)
            MGDefault.synchronize()
        }
    }
    
//     保存用户信息
    static func saveUserInfo(_ model:XBUserModel?){
        
//        XBJpushManager.setUserAlias(userId: model?.userid?.toString)
        
        MGDefault.set(model?.authstatus, forKey:XBAuthstatus)
        MGDefault.set(model?.accountId, forKey:XBAccountId)
        MGDefault.set(model?.dispname, forKey:XBDispname)
        MGDefault.set(model?.email, forKey:XBEmail)
        MGDefault.set(model?.isAdmin, forKey:XBIsAdmin)
        MGDefault.set(model?.isFinance, forKey:XBIsFinance)
        MGDefault.set(model?.isMgr, forKey:XBIsMgr)
        MGDefault.set(model?.logourl, forKey:XBLogourl)
        MGDefault.set(model?.nickname, forKey:XBNickname)
        MGDefault.set(model?.phone, forKey:XBPhone)
        MGDefault.set(model?.profile, forKey:XBProfile)
        MGDefault.set(model?.securityLevel, forKey:XBSecuritylevel)
        MGDefault.set(model?.sex, forKey:XBSex)
        MGDefault.set(model?.identitycard, forKey:XBIdentitycard)
//        MGDefault.set(model?.sendusername, forKey:XBSendusername)
        MGDefault.set(model?.truename, forKey:XBTruename)
        MGDefault.set(model?.userid, forKey:XBUserid)
        MGDefault.set(model?.username, forKey:XBUsername)
        MGDefault.set(model?.address, forKey:XBAddress)
        MGDefault.set(model?.area, forKey:XBArea)
        
        MGDefault.set(model?.totalBalance, forKey:XBTotalBalance)
        MGDefault.set(model?.balance, forKey:XBBalance)
        MGDefault.set(model?.voucherBalance, forKey:XBVoucherBalance)
        MGDefault.set(model?.friendCount, forKey:XBFriendCount)

        // 保存当前登录的用户信息， 用户退出登录时， 显示登录界面
//        XBUserOutLoginManager.phone_old = XBUserManager.phone
//        XBUserOutLoginManager.photo_old = XBUserManager.logourl
        
        if let phone = model?.phone {
//             XBUserPhotoManager.photoDic[phone] = model?.logourl ?? ""
        }
        Noti_post(.refreshUserData,object: model)
        MGDefault.synchronize()

    }
    // 清空用户信息
    static func cleanUserInfo(){
        
//        XBTokenManager.clearToken()
        
//        XBJpushManager.deleteUserAlias()
        MGDefault.set(nil, forKey:XBAuthstatus)
        MGDefault.set(nil, forKey:XBAccountId)
        MGDefault.set(nil, forKey:XBDispname)
        MGDefault.set(nil, forKey:XBEmail)
        MGDefault.set(nil, forKey:XBIsAdmin)
        MGDefault.set(nil, forKey:XBIsFinance)
        MGDefault.set(nil, forKey:XBIsMgr)
        MGDefault.set(nil, forKey:XBLogourl)
        MGDefault.set(nil, forKey:XBNickname)
        MGDefault.set(nil, forKey:XBPhone)
        MGDefault.set(nil, forKey:XBProfile)
        MGDefault.set(nil, forKey:XBSecuritylevel)
        
        MGDefault.set(nil, forKey:XBSex)
        MGDefault.set(nil, forKey:XBIdentitycard)
//        MGDefault.set(nil, forKey:XBSendusername)
        MGDefault.set(nil, forKey:XBTruename)
        MGDefault.set(nil, forKey:XBUserid)
        MGDefault.set(nil, forKey:XBUsername)
        MGDefault.set(nil, forKey:XBAddress)
        MGDefault.set(nil, forKey:XBArea)
        
        MGDefault.set(nil, forKey:XBTotalBalance)
        MGDefault.set(nil, forKey:XBBalance)
        MGDefault.set(nil, forKey:XBVoucherBalance)
        MGDefault.set(nil, forKey:XBFriendCount)
        Noti_post(.refreshUserData)
        MGDefault.synchronize()
        
    }
    /**
     退出登录
     清空用户的各个信息
     */
    static func exitLogin(){
        cleanUserInfo()
    }
    
    
}

