//
//  PMApiPath.swift
//  XBPMDev
//
//  Created by mac on 2018/3/28.
//  Copyright © 2018年 mac-cx. All rights reserved.
//
import Foundation
/****************************API_URL接口**********************************/
extension RequestApi {
    // api 地址
    public var path:String{
        switch self {
       
        case .contentModules:   return "/roobo/appInterface.do?inter=/cms/modules"
        // 根据用户ID获取收藏列表
        case .getLikeList: return "/favorite/getlist.do"
        case .contentsub: return "/roobo/appInterface.do?inter=/cms/categories"
        case .contentsings: return "/roobo/appInterface.do?inter=/resources/list"
        case .getHistoryList: return "/demand/getlist.do"
        default:
            return ""
        }
    }
}


