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
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var viewPhone: UIView!
    @IBOutlet weak var viewPhoto: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "登录"
        self.currentNavigationNone = true
        // Do any additional setup after loading the view.
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
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickRegisterAction(_ sender: Any) {
        let vc = RegisterViewController()
        self.pushVC(vc)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
