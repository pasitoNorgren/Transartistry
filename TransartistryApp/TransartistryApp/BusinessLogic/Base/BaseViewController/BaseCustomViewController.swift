import UIKit.UIView

class BaseCustomViewController<View: UIView, ViewModel: ViewModelOutlets>: BaseConfigurableViewController<ViewModel> {

    private(set) lazy var customView = View()
    
    override func loadView() {
        view = customView
    }
}
