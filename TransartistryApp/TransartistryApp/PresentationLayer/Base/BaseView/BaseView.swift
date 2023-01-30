import UIKit.UIView

class BaseView: UIView, ViewLayerConfigurable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        initializeViewLayerBaseConfiguration()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
