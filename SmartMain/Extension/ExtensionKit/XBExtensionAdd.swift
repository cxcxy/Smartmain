//
//  BSExtensionAdd.swift
//  BSMaster
//
//  Created by 陈旭 on 2017/10/10.
//  Copyright © 2017年 陈旭. All rights reserved.
//

import Foundation
public typealias NavigationItemHandler = () -> ()
public func MGRgb(_ r:CGFloat,g:CGFloat,b:CGFloat,alpha:CGFloat = 1) -> UIColor{
    return UIColor(red:r/255.0, green: g/255.0, blue: b/255.0, alpha:alpha)
}
public func kkLog(){
    debugPrint("123")
}


public func MGFrame(_ x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat) -> CGRect{
    return CGRect(x: x, y: y, width: width, height: height)
}

public func MGNib(_ nibName:String) ->UINib{
    return UINib(nibName:nibName, bundle: Bundle.main)
}

//MARK:简写的实例化
public let MGDefault = UserDefaults.standard
public let MGNotificationCenter = NotificationCenter.default


//MARK:流水线加工控件

/**
 流水线label
 居中 背景白色label
 - returns: 居中 背景白色label 14号字体 字体颜色60，60，60  单行
 */
public func MGfactoryLabel() -> UILabel{
    let label = UILabel()
    label.textAlignment = .center
    label.backgroundColor = UIColor.white
    label.font = UIFont.systemFont(ofSize: 14)
    label.numberOfLines = 1
    label.textColor = MGRgb(60, g: 60, b: 60)
    return label
}

/**
 流水线View
 背景白色
 */
public func MGfactoryView() -> UIView{
    let view = UIView()
    view.backgroundColor = UIColor.white
    return view
}

public func MGFactoryButton() ->UIButton{
    let view = UIButton()
    return view
}


public extension Bundle{
    static func loadResourceName(_ name:String!) -> AnyObject?{
        return  Bundle.main.loadNibNamed(name, owner: self, options: nil)?.last as AnyObject?
    }
}

public extension UIApplication{
    
    public class func currentViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return currentViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return currentViewController(selected)
            }
        }
        
        if let presented = base?.presentedViewController {
            return currentViewController(presented)
        }
        
        return base
    }
}

public extension UIButton{
    
    /// 倒计时
    ///
    /// - parameter timeLine: 倒计时总时间
    /// - parameter title: 还没倒计时的title
    /// - parameter mainBGColor: 还没倒计时的背景颜色
    /// - parameter mainTitleColor: 还没倒计时的文字颜色
    /// - parameter countBGColor: 倒计时中的背景颜色
    /// - parameter countTitlecolor: 倒计时中的文字颜色
    /// - parameter handle: 点击按钮的事件
    /// - returns: void
    
    func startTimer( _ timeLine: Int,
                     title: String,
                     mainBGColor: UIColor,
                     mainTitleColor: UIColor,
                     countBGColor: UIColor,
                     countTitleColor: UIColor,
                     isEnabled: Bool = false,
                     handle: (() -> Void)?) {
        var time = timeLine
        // 先创建一个默认队列
        let queue = DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default)
        
        // 再创建一个用户事件 source 倒计时
        let timer = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags(rawValue: UInt(0)), queue: queue)
        
        // 把timer设置进去
        /**
         start参数控制计时器第一次触发的时刻。参数类型是 dispatch_time_t，这是一个opaque类型，我们不能直接操作它。我们得需要 dispatch_time 和  dispatch_walltime 函数来创建它们。另外，常量  DISPATCH_TIME_NOW 和 DISPATCH_TIME_FOREVER 通常很有用。
         interval参数没什么好解释的。
         leeway参数比较有意思。这个参数告诉系统我们需要计时器触发的精准程度。所有的计时器都不会保证100%精准，这个参数用来告诉系统你希望系统保证精准的努力程度。如果你希望一个计时器没五秒触发一次，并且越准越好，那么你传递0为参数。另外，如果是一个周期性任务，比如检查email，那么你会希望每十分钟检查一次，但是不用那么精准。所以你可以传入60，告诉系统60秒的误差是可接受的。
         */
        timer.scheduleRepeating(deadline: DispatchTime.now(),
                                
                                interval: .seconds(1),
                                
                                leeway: .seconds(0)
            
        )
        //        timer.setTimer(start: DispatchWallTime(time: nil), interval: 1 * NSEC_PER_SEC, leeway: 0)
        
        // 内建事件
        
        timer.setEventHandler {[weak self] () -> Void in
            if let strongSelf = self {
                if time == 1 {
                    
                    // 只能用这种方式取消
                    timer.cancel()
                    // 刷新UI要回到主线程
                    DispatchQueue.main.async(execute: { () -> Void in
                        
                        
                        strongSelf.backgroundColor = mainBGColor
                        strongSelf.setTitleColor(mainTitleColor, for: UIControlState())
                        strongSelf.setTitle(title, for: UIControlState())
                        strongSelf.isUserInteractionEnabled = true // 这里不要用enable
                        
                    })
                    
                } else {
                    let content = "剩余\((time - 1) % 60)秒"
                    DispatchQueue.main.async(execute: { () -> Void in
                        
                        strongSelf.backgroundColor = countBGColor
                        strongSelf.setTitleColor(countTitleColor, for: UIControlState())
                        strongSelf.setTitle(content, for: UIControlState())
                        strongSelf.isUserInteractionEnabled = isEnabled // 这里不要用enable
                        
                    })
                    
                    
                }
                
            }
            
            time -= 1
            
        }
        
        // 启动
        timer.resume()
        
        if handle != nil {
            handle!()
        }
        
    }
    
    
}


/**
 MissingHashMarkAsPrefix:   "Invalid RGB string, missing '#' as prefix"
 UnableToScanHexValue:      "Scan hex error"
 MismatchedHexStringLength: "Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8"
 */



public enum DeviceType: Int
{
    case dt_UNKNOWN = 0
    case dt_iPhone4S          //iPhone4S、iPhone4
    case dt_iPhone5           //iPhone5、iPhone5C和iPhone5S
    case dt_iPhone6           //iPhone6
    case dt_iPhone6_Plus      //iPhone6 Plus
    case dt_iPad              //iPad1、iPad2
    case dt_iPad_Mini         //iPad mini1
    case dt_iPad_Retina       //New iPad、iPad4和iPad Air
    case dt_iPad_Mini_Retina  //iPad mini2
}

public extension UIDevice{
    static var deviceType:DeviceType{
        get {
            if let size = UIScreen.main.currentMode?.size{
                switch size{
                case CGSize(width: 640 , height: 960 ) : return .dt_iPhone4S
                case CGSize(width: 640 , height: 1136) : return .dt_iPhone5
                case CGSize(width: 750 , height: 1334) : return .dt_iPhone6
                case CGSize(width: 1242, height: 2208) : return .dt_iPhone6_Plus
                case CGSize(width: 1024, height: 768 ) : return .dt_iPad
                case CGSize(width: 768 , height: 1024) : return .dt_iPad_Mini
                case CGSize(width: 2048, height: 1536) : return .dt_iPad_Retina
                case CGSize(width: 1536, height: 2048) : return .dt_iPad_Mini_Retina
                default : return .dt_UNKNOWN
                }
            }
            return .dt_UNKNOWN
        }
    }
    
    
    /**
     判断当前设备是不是iPhone设备
     */
    class func isPhone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    /**
     判断当前设备是不是iPad设备
     */
    class func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    /**
     判断当前设备是不是iPad mini
     */
    class func isPadMini() -> Bool {
        if isPad() {
            let type = deviceType
            if type == .dt_iPad_Mini || type == .dt_iPad_Mini_Retina {
                return true
            }
        }
        
        return false
    }
    
    /**
     判断当前设备是不是iPad设备，不包括iPad mini
     */
    class func isBigPad() -> Bool {
        if isPad() && isPadMini() == false {
            return true
        }
        
        return false
    }
    
    /**
     判断当前设备的系统版本是否大于或者等于#version
     */
    func isGE(version: String) -> Bool {
        return compare(version: version) != .orderedAscending
    }
    
    func compare(version: String) -> ComparisonResult {
        return UIDevice.current.systemVersion.compare(version, options: NSString.CompareOptions.numeric)
    }
    
    
}


class ActionManager:NSObject{
    var actionDict:Dictionary<NSValue,()->()> = Dictionary()
    static let sharedManager = ActionManager()
    override fileprivate init(){}
}

public extension UIView{
    //MARK:Layer
    func borderColor(_ borderWidth:CGFloat,borderColor:UIColor){
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    func borderRadius(_ radius:CGFloat){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    
    func addCorner(_ roundingCorners: UIRectCorner, cornerSize: CGSize) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: roundingCorners, cornerRadii: cornerSize)
        let cornerLayer = CAShapeLayer()
        cornerLayer.frame = bounds
        cornerLayer.path = path.cgPath
        layer.mask = cornerLayer
    }
    
    /**
     * 默认为为grayColor
     * 默认透明度为0.5
     * 默认扩散范围为2
     * 默认阴影范围为size(1,1)
     - parameter color:
     */
    func shadow(_ color:UIColor = UIColor.gray,shadowOpacity:Float = 0.5,shadowRadius:CGFloat = 2,shadowOffset:CGSize = CGSize(width: 1, height: 1)) {
        self.layer.shadowColor = color.cgColor // 阴影的颜色
        self.layer.shadowOpacity = shadowOpacity // 阴影透明
        self.layer.shadowRadius = shadowRadius //// 阴影扩散的范围控制
        self.layer.shadowOffset = shadowOffset // 阴影的范围
        
    }
    
    
    //MARK:ACTION
    func addAction(_ closure:@escaping ()->()){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.tapClick(_:)))
        self.addGestureRecognizer(tap)
        ActionManager.sharedManager.actionDict[NSValue(nonretainedObject: self)] = closure
    }
    
    @objc func tapClick(_ tap:UITapGestureRecognizer){
        if let closure = ActionManager.sharedManager.actionDict[NSValue(nonretainedObject: tap.view)]{
            closure()
        }else{
            
        }
    }
}


extension UIView {
        
        /// 裁剪 view 的圆角
        func clipRectCorner(_ direction: UIRectCorner, cornerRadius: CGFloat) {
            let cornerSize = CGSize(width: cornerRadius, height: cornerRadius)
            let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
            let maskLayer = CAShapeLayer()
            maskLayer.frame = bounds
            maskLayer.path = maskPath.cgPath
            layer.addSublayer(maskLayer)
            layer.mask = maskLayer
        }
        
        /// x
        var x: CGFloat {
            get {
                return frame.origin.x
            }
            set(newValue) {
                var tempFrame: CGRect = frame
                tempFrame.origin.x    = newValue
                frame                 = tempFrame
            }
        }
        
        /// y
        var y: CGFloat {
            get {
                return frame.origin.y
            }
            set(newValue) {
                var tempFrame: CGRect = frame
                tempFrame.origin.y    = newValue
                frame                 = tempFrame
            }
        }
        
        /// height
        var height: CGFloat {
            get {
                return frame.size.height
            }
            set(newValue) {
                var tempFrame: CGRect = frame
                tempFrame.size.height = newValue
                frame                 = tempFrame
            }
        }
        
        /// width
        var width: CGFloat {
            get {
                return frame.size.width
            }
            set(newValue) {
                var tempFrame: CGRect = frame
                tempFrame.size.width = newValue
                frame = tempFrame
            }
        }
        
        /// size
        var size: CGSize {
            get {
                return frame.size
            }
            set(newValue) {
                var tempFrame: CGRect = frame
                tempFrame.size = newValue
                frame = tempFrame
            }
        }
        
        /// centerX
        var centerX: CGFloat {
            get {
                return center.x
            }
            set(newValue) {
                var tempCenter: CGPoint = center
                tempCenter.x = newValue
                center = tempCenter
            }
        }
        
        /// centerY
        var centerY: CGFloat {
            get {
                return center.y
            }
            set(newValue) {
                var tempCenter: CGPoint = center
                tempCenter.y = newValue
                center = tempCenter;
            }
        }
        
}

