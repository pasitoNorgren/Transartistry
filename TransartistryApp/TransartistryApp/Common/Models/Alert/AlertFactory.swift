import UIKit.UIAlertController

enum AlertFactory {
    
    static func createAlert(description: AlertDescription) -> UIAlertController {
        
        let controller = UIAlertController(title: description.title,
                                           message: description.message,
                                           preferredStyle: description.style.styleDescription)
        
        description.actions.forEach { action in
            let alertAction = UIAlertAction(title: action.title,
                                            style: action.style.styleDescription) { [weak action] _ in
                action?.closure?()
            }
            
            controller.addAction(alertAction)
        }
        
        return controller
    }
    
}
