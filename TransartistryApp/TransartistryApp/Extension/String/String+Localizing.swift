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
}
