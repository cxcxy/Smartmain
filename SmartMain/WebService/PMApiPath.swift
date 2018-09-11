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
        case .contentModules:           return "/resource/appInterface.do?inter=/cms/modules"
            // 第二级
        case .contentsub:               return "/resource/appInterface.do?inter=/cms/categories"
            // 第三级
        case .contentsings:             return "/resource/appInterface.do?inter=/resources/list"
        // 根据用户ID获取收藏列表
        case .getLikeList:              return "/favorite/getlist.do"
        case .getHistoryList:           return "/demand/getlist.do"
           //获取预制列表信息
        case .getTrackList:             return "/tracklist/getlistview.do"
        //获取预制列表信息
        case .getTrackSubList:          return "/track/getpage.do"
        case .setTrackListDefult(let trackId, let deviceId): return "/tracklist/inital.do?trackListId=\(trackId)&deviceId=\(deviceId)"
        //获取指定预制列表信息
        case .getSingleTrack:          return "/track/get.do"
            // 登录接口
        case .login(let mobile,let code):                    return "/suportAPP/loginWithAuthCode.do?username=\(mobile)&authCode=\(code)"
        case .loginWithPass(let mobile,let password):                    return "/suportAPP/loginWithPassword.do?username=\(mobile)&password=\(password)"
        case .register:                 return "/suportAPP/registUser.do"
            
        case .getAuthCode(let mobile):  return "/suportAPP/getAuthCode.do?mobile=" + mobile
            
        
            
        case .familyRegister:           return "/familymember/register.do"
        // 获取设备信息
        case .getEquimentInfo:          return "/boxinfo/get.do"
        // 获取设备改名
        case .modifyDeviceName:          return "/boxinfo/rename.do"
        // 修改音量
        case .modifyDeviceVolume:          return "/boxinfo/setvolume.do"
            // 加入设备第一步
        case .joinEquiment:             return "/familymember/join.do"
            // 加入设备第二步
        case .joinEquimentGroup:        return "/suportAPP/joinEaseGroup.do"
            // 接触设备绑定
        case .quitEquiment(_ , let isAdmin):        return "/familymember/quit.do?byAdmin=\(isAdmin)"
            
        //根据设备号获取群组成员列表
        case .getFamilyMemberList:      return "/familymember/getlist.do"
        //在线点播
        case .onlineSing:               return "/demand/online/save.do"
        // 删除点播
        case .deleteDemand:          return "/demand/delete.do"
        // 保存收藏
        case .saveLikeSing:          return "/favorite/save.do"
        // 删除收藏
        case .deleteLikeSing:          return "/favorite/delete.do"
        // 添加多首歌曲到预制列表
        case .addSingsToTrack:          return "/resource/tracklist/addTrackBatch.do"
        // 把歌曲从旧列表拷贝到新列表
        case .copyToNewTrackList:          return "/track/copy.do"
        // 把歌曲从旧列表移动到新列表
        case .moveToNewTrackList:          return "/track/move.do"
        // 把歌曲从列表中删除
        case .removeSingsList:          return "/track/remove.do"
        // 新增一个列表
        case .addTrackList:          return "/tracklist/add.do"
        // 删除一个列表
        case .deleteTrackList:          return "/tracklist/remove.do"
        // app向设备发送文字接口(post)
        case .sendVoiceDevice:               return "/suportAPP/appSendVoiceToDevice.do"
        // 上传头像文件到服务器
        case .uploadAvatar:               return "/familymember/avatar/upload.do"
        // 设置或重设用户账号头像
        case .resetAvatar:               return "/familymember/avatar/reset.do"
        // 修改账号昵称
        case .modifyNickname:               return "/familymember/modifynickname.do"
        default:
            
            return ""
        }
    }
}


