//
//  ContentReqModel.swift
//  SmartMain
//
//  Created by 陈旭 on 2018/9/4.
//  Copyright © 2018年 上海际浩智能科技有限公司（InfiniSmart）. All rights reserved.
//

import UIKit
import ObjectMapper
class ContentReqModel: XBDataModel {
    var appId:String?
    var token: String?
    var clientId: String?
    var userId: String?
    var tag: [String] = []
    
    override func mapping(map: Map) {
        appId             <-    map["appId"]
        token             <-    map["token"]
        clientId          <-    map["clientId"]
        userId            <-    map["userId"]
        tag            <-    map["tag"]
    }
}
class ModulesResModel: XBDataModel {
    var id:String?
    var name: String?
    var icon: String?
    var contents: [ModulesConetentModel]?
    override func mapping(map: Map) {
        id             <-    map["id"]
        name             <-    map["name"]
        icon          <-    map["icon"]
        contents <-    map["contents"]
    }
}
class ModulesConetentModel: XBDataModel {
    var id:String?
    var type: String?
    var name: String?
    var imgLarge: String?
    var imgSmall: String?
    var albumType: Int?
    override func mapping(map: Map) {
        id             <-    map["id"]
        type             <-    map["type"]
        name          <-    map["name"]
        imgLarge            <-    map["imgLarge"]
        imgSmall            <-    map["imgSmall"]
        albumType            <-    map["albumType"]
    }
}
