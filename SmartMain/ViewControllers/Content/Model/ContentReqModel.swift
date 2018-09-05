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
class ConetentSingModel: XBDataModel {
    var length:Int?
    var content: String?
    var artist: String?
    var favoriteId: String?
    var resId: String?
    var playUrls: ConetentSingPlayModel?
    var type: Int?
    var name: String?
    override func mapping(map: Map) {
        length             <-    map["length"]
        content             <-    map["content"]
        artist          <-    map["artist"]
        favoriteId            <-    map["favoriteId"]
        resId            <-    map["resId"]
        playUrls            <-    map["playUrls"]
        type            <-    map["type"]
        name            <-    map["name"]
    }
}
class ConetentSingAlbumModel: XBDataModel {
    var imgLarge:String?
    var imgSmall: String?
    var albumId: String?
    var name: String?
    var description: String?
    var total: Int?
    override func mapping(map: Map) {
        imgLarge             <-    map["imgLarge"]
        imgSmall             <-    map["imgSmall"]
        albumId             <-    map["albumId"]
        name             <-    map["name"]
        description             <-    map["description"]
        total             <-    map["total"]
    }
}
class ConetentSingPlayModel: XBDataModel {
    var size:Int?
    var url: String?
    override func mapping(map: Map) {
        size             <-    map["size"]
        url             <-    map["url"]
    }
}
