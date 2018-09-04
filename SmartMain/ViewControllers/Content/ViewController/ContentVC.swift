//
//  ContentVC.swift
//  SmartMain
//
//  Created by mac on 2018/9/4.
//  Copyright © 2018年 上海际浩智能科技有限公司（InfiniSmart）. All rights reserved.
//

import UIKit

class ContentVC: XBBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentNavigationTitleColor = UIColor.black
        tableView.cellId_register("ContentHeaderCell")
        tableView.cellId_register("ContentShowCell")
        tableView.cellId_register("ContentShowThreeCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
extension ContentVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContentHeaderCell", for: indexPath) as! ContentHeaderCell
            
            return cell
        }
        if indexPath.row == 1 || indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContentShowCell", for: indexPath) as! ContentShowCell
            cell.collectionDataArr = ["1","2","3","4"]
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentShowThreeCell", for: indexPath) as! ContentShowThreeCell
        cell.collectionDataArr = ["1","2","3","4","1","2","3","4","1"]
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
