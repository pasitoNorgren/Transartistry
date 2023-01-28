import UIKit.UIView

class BaseView: UIView, ViewLayerConfigurable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        initializeViewLayerBaseConfiguration()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
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
