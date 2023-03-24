import UIKit

protocol LeftBarButtonItemSetting: BarButtonItemSetting {
    func setupLeftBarButtonItem()
}

extension LeftBarButtonItemSetting where Self: UIViewController {
    
    func setupLeftBarButtonItem() {
        setupBarButtonItem()
    }
    
    func setupBarButtonItem() {
        setupBaseBackBarButtonItem()
    }
}
