//
//  ContentSingCell.swift
//  SmartMain
//
//  Created by mac on 2018/9/5.
//  Copyright © 2018年 上海际浩智能科技有限公司（InfiniSmart）. All rights reserved.
//

import UIKit

class ContentSingCell: BaseTableViewCell {

    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbLineNumber: UILabel!
    var trackId: String?
    var duration: String?
    var title: String?
    var listId: Int? // 预制列表二级列表 列表ID
    var singModelData: EquipmentSingModel? { // 预制列表菜单Model
        didSet {
            guard let m = singModelData else {
                return
            }
            self.lbTitle.set_text = m.title
            self.lbTime.set_text = XBUtil.getDetailTimeWithTimestamp(timeStamp: m.duration)
            self.trackId = m.id?.toString
            self.duration = m.duration?.toString
            self.title = m.title
        }
    }
    var modelData: ConetentSingModel? { // 三级页面Model
        didSet {
            guard let m = modelData else {
                return
            }
            self.lbTitle.set_text = m.name
            self.lbTime.set_text = XBUtil.getDetailTimeWithTimestamp(timeStamp: m.length)
            if let arr = m.resId?.components(separatedBy: ":") {
                if arr.count > 0 {
                    self.trackId = arr[1]
                }
            }
            self.duration = m.length?.toString
            self.title = m.name
        }
    }
    var likeModelData: ConetentLikeModel? { // 收藏页面Model
        didSet {
            guard let m = likeModelData else {
                return
            }
            self.lbTitle.set_text = m.title
            self.lbTime.set_text = XBUtil.getDetailTimeWithTimestamp(timeStamp: m.duration)
            self.trackId = m.trackId?.toString
            self.duration = m.duration?.toString
            self.title = m.title
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func clickMnumAction(_ sender: Any) {
        let v = ShowChooseView.loadFromNib()
        v.btnLike.addAction {[weak self] in
            guard let `self` = self else { return }
            self.requestLikeSing()
        }
        v.btnCancleLike.addAction {[weak self] in
            guard let `self` = self else { return }
            self.requestCancleLikeSing()
        }
        v.btnDeleteDemand.addAction {[weak self] in
            guard let `self` = self else { return }
            self.requestDeleteDemand()
        }
        v.btnAddSingList.addAction {[weak self] in
            guard let `self` = self else { return }
            self.requestDeleteSingWithList()
        }
        v.show()
    }
    func requestDeleteSingWithList()  {
        var params_task = [String: Any]()
        params_task["deviceId"] = XBUserManager.device_Id
        params_task["id"]  = listId
        params_task["trackId"] = [trackId]
        Net.requestWithTarget(.removeSingsList(req: params_task), successClosure: { (result, code, message) in
            print(result)
            if let str = result as? String {
                if str == "ok" {
                    XBHud.showMsg("收藏成功")
                }else {
                    XBHud.showMsg("收藏失败")
                }
            }
        })
    }
    func requestLikeSing()  {
        
        var params_task = [String: Any]()
        params_task["openId"] = XBUserManager.userName
        params_task["trackId"]  = trackId
        params_task["duration"] = duration
        params_task["title"]    = title
        Net.requestWithTarget(.saveLikeSing(req: params_task), successClosure: { (result, code, message) in
            print(result)
            if let str = result as? String {
                if str == "ok" {
                    XBHud.showMsg("收藏成功")
                }else {
                    XBHud.showMsg("收藏失败")
                }
            }
        })

    }
    func requestCancleLikeSing()  {
        
        var params_task = [String: Any]()
        params_task["openId"] = XBUserManager.userName
        params_task["trackId"]  = trackId
        Net.requestWithTarget(.deleteLikeSing(req: params_task), successClosure: { (result, code, message) in
            print(result)
            if let str = result as? String {
                if str == "ok" {
                    XBHud.showMsg("取消收藏成功")
                }else {
                    XBHud.showMsg("取消收藏失败")
                }
            }
        })
        
    }
    func requestDeleteDemand()  {
        
        var params_task = [String: Any]()
        params_task["deviceId"] = XBUserManager.device_Id
        params_task["trackId"]  = trackId
        Net.requestWithTarget(.deleteDemand(req: params_task), successClosure: { (result, code, message) in
            print(result)
            if let str = result as? String {
                if str == "ok" {
                    XBHud.showMsg("删除点播成功")
                }else {
                    XBHud.showMsg("删除点播失败")
                }
            }
        })
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
