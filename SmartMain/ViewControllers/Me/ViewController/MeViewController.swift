//
//  MeViewController.swift
//  SmartMain
//
//  Created by 陈旭 on 2018/9/4.
//  Copyright © 2018年 上海际浩智能科技有限公司（InfiniSmart）. All rights reserved.
//

import UIKit

class MeViewController: XBBaseViewController {

    @IBOutlet weak var btnLoginOut: UIButton!
    @IBOutlet weak var viewCenter: UIView!
    @IBOutlet weak var viewPhoto: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.isTranslucent = true
    }
    override func setUI() {
        super.setUI()
        self.title = "宝宝"
        viewCenter.setCornerRadius(radius: 5)
        btnLoginOut.setCornerRadius(radius: 15)
//        self.currentNavigationColor =  MGRgb(0, g: 145, b: 222)
//        self.currentNavigationHidden
        self.currentNavigationNone = true
        viewPhoto.roundView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
