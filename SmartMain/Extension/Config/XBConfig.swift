//
//  BSConfig.swift
//  BSMaster
//
//  Created by 陈旭 on 2017/9/29.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import Foundation

//MARK:  print -- log
let XBDEBUG = XBUtil.getHermesConfiguration("LogPrint")
public func XBLog<T> (_ value: T , fileName : String = #file, function:String = #function, line : Int32 = #line ){
 
    if XBDEBUG == "0" {
        print("file：\(URL(string: fileName)?.lastPathComponent ?? "")\nline:- \(line)\nfunction:- \(function)\nlog: \(value)\n")
    }
}

public func XBApiLog<T> (_ value: T , fileName : String = #file, function:String = #function, line : Int32 = #line ){
    
    if XBDEBUG == "0" {
        print("\(value)")
    }
}
//let testDeviceId = "3010290000045007_1275"

let testDeviceId = user_defaults.get(for: .deviceId) ?? ""

//MARK:   延迟多少秒 回掉
struct XBDelay {
    static func start(delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    
}
let XBUrl   = "https://www.96369.net/mobile/pmprotocal.html"
let HelpUrl = "http://www.96369.net/mobile/pmhelp.html"
public let MGScreenWidth:CGFloat        = UIScreen.main.bounds.size.width
public let MGScreenHeight:CGFloat       = UIScreen.main.bounds.size.height
public let MGScreenWidthHalf:CGFloat    = MGScreenWidth / 2
public let MGScreenHeightHalf:CGFloat   = MGScreenHeight / 2

//／ 最小值 类似 0.0001
let XBMin:CGFloat = CGFloat.leastNormalMagnitude
//／ 顶部布局自适应高度
var XBTopHeight:CGFloat! {
    get {
        if UIDevice.deviceType == .dt_iPhone6_Plus {
            return MGScreenWidth * (14 / 25)
        }else {
             return 210
        }
    }
}


public func XBRgb(_ r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat = 1) -> UIColor{
    return UIColor(red:r/255.0, green: g/255.0, blue: b/255.0, alpha:alpha)
}

//MARK: tableView 无数据展示状态
let XBNoDataTitle:NSAttributedString    =   NSAttributedString(string: "暂无数据",
                                                               attributes:[NSAttributedStringKey.foregroundColor:MGRgb(25, g: 28, b: 39),
                                                                           NSAttributedStringKey.font:UIFont.systemFont(ofSize: 17)])


let XBStatusBarHight                = UIApplication.shared.statusBarFrame.height
//MARK: 登录成功
let Noti_LoginSuccess             = "Noti_LoginSuccess"
//MARK: 刷新公司列表
let Noti_RefreshCompany             = "Noti_RefreshCompany"
//MARK: 刷新任务数量列表
let Noti_RefreshMissionList         = "Noti_RefreshListCompany"
//MARK: 刷新部门列表任务数量
let Noti_RefreshDeartmentMissionList         = "Noti_RefreshDeartmentMissionList"
//MARK: 退出登录
let Noti_Logout                     = "Noti_Logout"
//MARK :刷新未完成的流程列表
let Noti_RefreshWorkFlowList        = "Noti_RefreshWorkFlowList"

//MARK :刷新部门任务列表数据
let Noti_RefreshDepartTaskList        = "Noti_RefreshDepartTaskList"
//MARK :刷新 返回到档案列表页面，而且刷新档案列表
let Noti_RefreshArchivesList        = "Noti_RefreshArchivesList"
//MARK :刷新 返回到添加部门页面时， 成员数量
let Noti_RefreshAddDepartmentData        = "Noti_RefreshAddDepartmentData"
//MARK :添加商家刷新数据
let Noti_RefreshAddCompanyRefreshData        = "Noti_RefreshAddCompanyRefreshData"

//MARK: 全局分页行数
let XBPageSize:Int                  =  15
//MARK: 全局行间距
let XBLineBreak: CGFloat            = 1.3
//MARK: 全局行间距
let XBLineBreakNumber: CGFloat            = 5

//MARK: 全局下线弹框状态,1:已出现
var XBLoginShow:Int                 =  0

//TODO: 全局tableView 背景色
let tableColor                      =   UIColor.init(hexString: "F3F3F3")! 

//MARK: 导航栏背景色

let XBNavColor                      = UIColor.white

//MARK: 描边背景色  红色

let XBBorderColor                   = UIColor.init(hexString: "E43D39")!

//MARK: tableViewCell Line颜色
let XBCellLineColor                 = MGRgb(221, g: 226, b: 228)
//MARK: 评分标题
let XBScoreTitleArray: [String]     = ["极差","差","一般","较好","好","极好"]
//MARK: 评分
let XBScoreArray: [Int]             = [-5,-3,1,2,3,5]

let XBScoreNone : String            = "暂未达到评分标准"

typealias XBActionClosure           = () -> ()
typealias XBObjectActionClosure     = (_ object:AnyObject) ->()

let XBNavImg = UIImage.init()

