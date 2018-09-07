//
//  PMRequestApi.swift
//  XBPMDev
//
//  Created by mac on 2018/3/28.
//  Copyright © 2018年 mac-cx. All rights reserved.
//
import UIKit
import Moya
/**
 *   定义一个接口的 Api 格式
 */
enum RequestApi{
    
    //MARK: 登录注册相关接口
   
    case contentModules(req: [String: Any])
    case contentsub(req: [String: Any])
    case getLikeList(openId: String)
    case getHistoryList(openId: String)
    case getTrackList(deviceId: String)
    case getTrackSubList(req: [String: Any])
    case contentsings(req: [String: Any])
    case login(req: [String: Any])
    case register(req: [String: Any])
    case familyRegister(req: [String: Any])
    case changePassword(req: [String: Any])
    case getEquimentInfo(deviceId: String)
    case joinEquiment(req: [String: Any])
    case joinEquimentGroup(req: [String: Any])
    case getFamilyMemberList(deviceId: String)
    case onlineSing(openId:String, trackId: String)
}
extension RequestApi {
    /**
     *   格式化 请求服务器的 json model 格式
     */
    fileprivate func format(m: XBDataModel? = nil) -> [String: Any]{
        let baseReq         = XBBaseReqModel.init()
        baseReq.reqdata     = m
        return baseReq.toJSON()
    }
    /**
     *   格式化 请求服务器的 json dic 字典格式
     */
    fileprivate func formatDic(dic: [String: Any]? = nil) -> [String: Any]{
        var params_task         = [String: Any]()
        params_task             = XBBaseReqModel.init().toJSON()
        params_task["reqdata"]  = dic
        return params_task
    }
    /**
     *   格式化 请求服务器的 json 字典格式
     */
    fileprivate func formatArr(dic: [Any]? = nil) -> [String: Any]{
        var params_task         = [String: Any]()
        params_task             = XBBaseReqModel.init().toJSON()
        params_task["reqdata"]  = dic
        return params_task
    }
}
extension RequestApi:TargetType{

    
    // 服务器地址
    public var baseURL:URL{
        
        return URL(string: ConfigManager.getServiceUrl())!

    }
    
    //请求任务事件（这里附带上参数）
    public var task: Task {
        var params_task = [String: Any]()
        switch self {
        case .contentModules(let req),
             .login(let req),
             .register(let req),
             .changePassword(let req),
             .familyRegister(let req),
             .joinEquiment(let req),
             .joinEquimentGroup(let req):
            params_task = req
            break
        case .onlineSing(let openId,let trackId):
            params_task["openId"] = openId
            params_task["trackId"] = trackId
            break
        case .contentsub(let req):
            params_task = req
            break
        case .getLikeList(let openId):
            params_task["openId"] = openId
            return .requestParameters(parameters: params_task,
                                      encoding: URLEncoding.default)
        case .getTrackSubList(let req):
            params_task = req
            return .requestParameters(parameters: params_task,
                                      encoding: URLEncoding.default)
        case .getHistoryList(let openId):
            params_task["openId"] = openId
            return .requestParameters(parameters: params_task,
                                      encoding: URLEncoding.default)
        case .getEquimentInfo(let deviceId),
             .getFamilyMemberList(let deviceId),
             .getTrackList(let deviceId):
            params_task["deviceId"] = deviceId
            return .requestParameters(parameters: params_task,
                                      encoding: URLEncoding.default)

        case .contentsings(let req):
            params_task = req
            break
        default:
            return .requestPlain
        }
        
        return .requestParameters(parameters: params_task,
                                  encoding: JSONEncoding.default)
    }

    // 请求头信息
    public var headers: [String : String]? {
        return nil
    }
    // 接口请求类型
    public var method:Moya.Method{
        switch self {
        case .getLikeList,.getHistoryList,.getTrackList,.getTrackSubList,.getEquimentInfo,.getFamilyMemberList:
            return .get
        default:
            return .post
        }
    }

    //  单元测试用
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
}
