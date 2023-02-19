import UIKit.UIViewController
import RxSwift

extension UIViewController {
    
    func makeAlert(with description: AlertDescription) {
        
        let alertController = AlertFactory.createAlert(description: description)
        
        presentAlert(controller: alertController,
                     animated: description.isPresentationAnimated,
                     completion: description.openingCompilationHandler)
    }
    
    func presentAlert(controller: UIAlertController, animated: Bool, completion: VoidClosure?) {
        
        present(controller, animated: animated, completion: completion)
    }
}

extension Reactive where Base: UIViewController {
    var alertPresentation: Binder<AlertDescription> {
        Binder(self.base) { base, description in
            base.makeAlert(with: description)
        }
    }
}
