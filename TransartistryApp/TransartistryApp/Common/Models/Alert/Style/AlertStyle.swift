import UIKit.UIAlertController

enum AlertStyle {
    
    case alert
    case sheet
    
    var styleDescription: UIAlertController.Style {
        switch self {
        case .alert:
            return .alert
        case .sheet:
            return .actionSheet
        }
    }
}
