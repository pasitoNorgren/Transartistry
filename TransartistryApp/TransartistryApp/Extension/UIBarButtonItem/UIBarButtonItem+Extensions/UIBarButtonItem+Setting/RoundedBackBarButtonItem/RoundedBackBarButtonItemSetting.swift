import UIKit

protocol RoundedBackBarButtonItemSetting: LeftBarButtonItemSetting, BackBarButtonItemActionHandling {
    func setupRoundedBarButtonItem()
}

extension RoundedBackBarButtonItemSetting where Self: UIViewController {
    
    func setupRoundedBarButtonItem() {
        setupLeftBarButtonItem()
        processLeftBarButtonItemTap()
    }
    
    func setupLeftBarButtonItem() {
        setupRoundedCrossBackBarButtonItem()
    }
}
