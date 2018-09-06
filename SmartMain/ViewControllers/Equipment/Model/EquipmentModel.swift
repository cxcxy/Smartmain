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
