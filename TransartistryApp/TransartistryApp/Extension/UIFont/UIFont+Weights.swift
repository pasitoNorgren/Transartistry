import UIKit.UIFont

extension UIFont {
    
    static func regularFont(of size: CGFloat) -> UIFont {
        .systemFont(ofSize: size, weight: .regular)
    }
    
    static func mediumFont(of size: CGFloat) -> UIFont {
        .systemFont(ofSize: size, weight: .medium)
    }
    
    static func semiboldFont(of size: CGFloat) -> UIFont {
        .systemFont(ofSize: size, weight: .semibold)
    }
    
    static func boldFont(of size: CGFloat) -> UIFont {
        .systemFont(ofSize: size, weight: .bold)
    }
    
    static func heavyFont(of size: CGFloat) -> UIFont {
        .systemFont(ofSize: size, weight: .heavy)
    }
}
