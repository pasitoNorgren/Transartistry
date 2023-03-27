import UIKit

extension UIViewController {
    
    func setupRoundedCrossBackBarButtonItem() {
        let image: UIImage? = .roundedCross?.withTintColor(.blackLM, renderingMode: .alwaysOriginal)
        
        setupLeftBarButtonItem(with: image)
    }
    
    func setupBaseBackBarButtonItem() {
        let image: UIImage? = .backArrow?.withTintColor(.blackLM, renderingMode: .alwaysOriginal)
        
        setupLeftBarButtonItem(with: image)
    }
    
    func setupLeftBarButtonItem(with image: UIImage?, style: UIBarButtonItem.Style = .plain) {
        
        let buttonItem = UIBarButtonItem(image: image,
                                         style: style,
                                         target: nil,
                                         action: nil)
        
        addLeftBarButton(item: buttonItem)
    }
    
    private func addLeftBarButton(item: UIBarButtonItem) {
        navigationItem.leftBarButtonItem = item
    }
}
