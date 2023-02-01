import UIKit.UIColor

extension UIColor {
    
    ///  general black in light mode
    static var blackLM: UIColor {
        return UIColor(named: "Black_LightMode") ?? .darkGray
    }
    
    ///  general white in light mode
    static var whiteLM: UIColor {
        return  UIColor(named: "White_LightMode") ?? .lightGray
    }
}
