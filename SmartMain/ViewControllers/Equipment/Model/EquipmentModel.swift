//
//  EquipmentModel.swift
//  SmartMain
//
//  Created by mac on 2018/9/6.
//  Copyright © 2018年 上海际浩智能科技有限公司（InfiniSmart）. All rights reserved.
//

import UIKit
import ObjectMapper
class EquipmentModel: XBDataModel {
    var id:Int?
    var deviceId: String?
    var name: String?
    var trackCount: Int?
    var downloadTrackCount: Int?
    var coverSmallUrl: String?
    var size: String?
    var play: Int?
    
    override func mapping(map: Map) {
        id             <-    map["id"]
        deviceId             <-    map["deviceId"]
        name          <-    map["name"]
        trackCount            <-    map["trackCount"]
        downloadTrackCount            <-    map["downloadTrackCount"]
        coverSmallUrl            <-    map["coverSmallUrl"]
        size            <-    map["size"]
        play            <-    map["play"]
    }
}
//MARK: 设备信息
class EquipmentInfoModel: XBDataModel {
    var id:String?
    var name: String?
    var net: String?
    var cardAvailable: Int?
    var cardTotal: Int?
    var electricity: Int?
    var firmwareVersion: String?
    var volume: Int?
    var online: Int?
    
    override func mapping(map: Map) {
        id             <-    map["id"]
        name          <-    map["name"]
        net            <-    map["net"]
        cardAvailable            <-    map["cardAvailable"]
        cardTotal            <-    map["cardTotal"]
        electricity            <-    map["electricity"]
        firmwareVersion            <-    map["firmwareVersion"]
        volume            <-    map["volume"]
        online            <-    map["online"]
    }
}
class EquipmentSingModel: XBDataModel {
    var id:Int?
    var title: String?
    var coverSmallUrl: String?
    var duration: Int?
    var albumTitle: String?
    var albumCoverSmallUrl: String?
    var url: String?
    var downloadUrl: String?
    var downloadUrlHashCode: String?
    var downloadSize: Int?
    var status: Int?
    
    
    override func mapping(map: Map) {
        id             <-    map["id"]
        title             <-    map["title"]
        coverSmallUrl          <-    map["coverSmallUrl"]
        duration            <-    map["duration"]
        albumTitle            <-    map["albumTitle"]
        albumCoverSmallUrl            <-    map["albumCoverSmallUrl"]
        url            <-    map["url"]
        downloadUrl            <-    map["downloadUrl"]
        downloadUrlHashCode            <-    map["downloadUrlHashCode"]
        downloadSize            <-    map["downloadSize"]
        status            <-    map["status"]
    }
}

class FamilyMemberModel: XBDataModel {

    var openId: String?
    var nickname: String?
    var deviceId: String?
    var headImgUrl: String?
    var type: Int?
    var admin: Int?
    
    
    override func mapping(map: Map) {
        openId             <-    map["openId"]
        nickname             <-    map["nickname"]
        deviceId          <-    map["deviceId"]
        headImgUrl            <-    map["headImgUrl"]
        type            <-    map["type"]
        admin            <-    map["admin"]

    }
}
class GetTrackListDefault: XBDataModel {
    
    var cmd: String?
    var trackListId: Int?
    var name: String?
    var trackIds: [Int]?

    override func mapping(map: Map) {
        
        cmd             <-    map["cmd"]
        trackListId             <-    map["trackListId"]
        name          <-    map["name"]
        trackIds            <-    map["trackIds"]
        
    }
}
class SingDetailModel: XBDataModel {
    
    var id: Int?
    var title: String?
    var coverSmallUrl: String?
    var duration: Int?
    var albumTitle: String?
    var albumCoverSmallUrl: String?
    var url: String?
    var downloadUrl: String?
    var downloadUrlHashCode: String?
    var downloadSize: String?
    var status: Int?
    
    override func mapping(map: Map) {
        
        id             <-    map["id"]
        title             <-    map["title"]
        coverSmallUrl          <-    map["coverSmallUrl"]
        duration            <-    map["duration"]
        albumTitle            <-    map["albumTitle"]
        albumCoverSmallUrl            <-    map["albumCoverSmallUrl"]
        url            <-    map["url"]
        downloadUrl            <-    map["downloadUrl"]
        downloadUrlHashCode            <-    map["downloadUrlHashCode"]
        downloadSize            <-    map["downloadSize"]
        status            <-    map["status"]
    }
}
