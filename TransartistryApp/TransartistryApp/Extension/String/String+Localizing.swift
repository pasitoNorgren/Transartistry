import Foundation

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        NSLocalizedString(self, tableName: tableName, value: .empty, comment: .empty)
    }
}

extension String {
    static var appName: String {
        "appName".localized().uppercased()
    }
    
    static var cameraPickerButtonTitle: String {
        "takeAPhoto".localized()
    }
    
    static var imagePickerButtonTitle: String {
        "chooseAPhoto".localized()
    }
    
    static var okTitle: String {
        "ok".localized()
    }
    
    static var cancelTitle: String {
        "cancel".localized()
    }
    
    static var okAlertTitle: String {
        "ok".localized().uppercased()
    }
}
