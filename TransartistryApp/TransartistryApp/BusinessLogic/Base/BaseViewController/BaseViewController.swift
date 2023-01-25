import UIKit.UIViewController

class BaseViewController: UIViewController, ViewLayerConfigurable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeViewLayerBaseConfiguration()
    }
    
    func configureSubviewsAdding() {
        // override in subclass
    }
    
    func configureLayout() {
        // override in subclass
    }
    
    func configureAppearance() {
        // override in subclass
    }
    
    func configureLocalization() {
        // override in subclass
    }
    
    func bindComponents() {
        // override in subclass
    }
}
