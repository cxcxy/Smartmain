//
//  LoginViewController.swift
//  SmartMain
//
//  Created by 陈旭 on 2018/9/5.
//  Copyright © 2018年 上海际浩智能科技有限公司（InfiniSmart）. All rights reserved.
//

import UIKit

class LoginViewController: XBBaseViewController {
    @IBOutlet weak var viewPassword: UIView!
    
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var viewPhoto: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "登录"
        self.currentNavigationNone = true
    }
    override func setUI() {
        super.setUI()
        view.backgroundColor = UIColor.white
        viewPhoto.roundView()
        viewPhone.setCornerRadius(radius: 10)
        viewPassword.setCornerRadius(radius: 10)
        viewPhone.addBorder(width: 0.5, color: UIColor.darkGray)
        viewPassword.addBorder(width: 0.5, color: UIColor.darkGray)
        btnLogin.setCornerRadius(radius: 10)
        btnLogin.addBorder(width: 0.5, color: UIColor.darkGray)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func clickForgetAction(_ sender: Any) {
        XBHud.showMsg("忘记密码")
    }
    
    @IBAction func clickRegisterAction(_ sender: Any) {
        
        var params_task = [String: Any]()
        params_task["username"] = tfPhone.text
        params_task["password"] = tfPassword.text
        params_task["nikename"] = "智伴小达人"
        Net.requestWithTarget(.register(req: params_task), successClosure: { (result, code, message) in
            if let str = result as? String {
                if str == "ok" {
                    print("注册成功")
//                    XBHud.showMsg("注册成功")
                    self.requestFamilyRegister()
                }else {
                    XBHud.showMsg("注册失败")
                }
            }
            print(result)
        })
    }
    func requestFamilyRegister()  {
        var params_task = [String: Any]()
        params_task["openId"] = tfPhone.text
        params_task["type"] = 2
        params_task["nickname"] = "智伴小达人"
        Net.requestWithTarget(.familyRegister(req: params_task), successClosure: { (result, code, message) in
            if let str = result as? String {
                if str == "ok" {
                    print("注册成功")
                    XBHud.showMsg("注册成功")
  

                }else {
                    XBHud.showMsg("注册失败")
                }
            }
            print(result)
        })
    }
    @IBAction func clickResetAction(_ sender: Any) {
        self.tfPhone.text = ""
    }
    
    @IBAction func clicResetPassAction(_ sender: Any) {
        tfPassword.text = ""
    }
    lazy var popWindow:UIWindow = {
        let w = UIApplication.shared.delegate as! AppDelegate
        return w.window!
    }()
    @IBAction func clickLoginAction(_ sender: Any) {
        if tfPhone.text! == "" {
            XBHud.showMsg("请输入手机号")
            return
        }
        XBUserManager.saveUserInfo(self.tfPhone.text!)
        let vc = XBTabBarController()
        popWindow.rootViewController = vc
    }
}
