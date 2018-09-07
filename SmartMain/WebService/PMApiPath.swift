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
        // 内容主页面接口
        case .contentModules:   return "/resource/appInterface.do?inter=/cms/modules"
            // 第二级
        case .contentsub: return "/resource/appInterface.do?inter=/cms/categories"
            // 第三级
        case .contentsings: return "/resource/appInterface.do?inter=/resources/list"
        // 根据用户ID获取收藏列表
        case .getLikeList: return "/favorite/getlist.do"
        case .getHistoryList: return "/demand/getlist.do"
           //获取预制列表信息
        case .getTrackList: return "/tracklist/getlistview.do"
        //获取预制列表信息
        case .getTrackSubList: return "/track/getpage.do"
            // 登录接口
        case .login: return ""
        case .register: return "/suportAPP/registUser.do"
        case .familyRegister: return "/familymember/register.do"
        // 获取设备信息
        case .getEquimentInfo: return "/boxinfo/get.do"
            // 加入设备第一步
        case .joinEquiment: return "/familymember/join.do"
            // 加入设备第二步
        case .joinEquimentGroup: return "/suportAPP/joinEaseGroup.do"
        //根据设备号获取群组成员列表
        case .getFamilyMemberList: return "/familymember/getlist.do"
        //在线点播
        case .onlineSing: return "/demand/online/save.do"
        default:
            
            return ""
        }
    }
}


