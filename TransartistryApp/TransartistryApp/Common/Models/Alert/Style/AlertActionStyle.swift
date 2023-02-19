import UIKit.UIAlertController

enum AlertActionStyle {
    
    case basic
    case cancel
    case redFlagged
    
    var styleDescription: UIAlertAction.Style {
        switch self {
        case .basic:
            return .default
        case .cancel:
            return .cancel
        case .redFlagged:
            return .destructive
        }
    }
}
