import UIKit.UIView

protocol ConfigurableView: UIView {
    
    associatedtype ModelType
    
    func configure(with model: ModelType)
}
