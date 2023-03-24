import UIKit

extension UIViewController {
    
    func hideNavigationController(animated: Bool = true) {
        setupNavigationControllerVisibility(isHidden: true, animated: animated)
    }
    
    func showNavigationController(animated: Bool = true) {
        setupNavigationControllerVisibility(isHidden: false, animated: animated)
    }
    
    private func setupNavigationControllerVisibility(isHidden: Bool, animated: Bool) {
        navigationController?.setNavigationBarHidden(isHidden, animated: animated)
    }
}
