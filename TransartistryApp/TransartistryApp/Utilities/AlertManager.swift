//
//  AlertManager.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 06.01.2022.
//

import UIKit

enum AlertType {
    case defaultAlert
}

class AlertManager {
    
    private enum Constants {
        enum TitleText {
            static let defaultAlertTitleText: String? = "errorOccured".localized()
            static let defaultAlertActionTitleText: String? = "cancel".localized()
        }
        
        enum MessageText {
            static let defaultAlertMessageText: String? = "fixingError".localized()
        }
    }
    
    static var shared = AlertManager()
    
    private init() {}
    
    func showAlert(type: AlertType) -> UIAlertController {
        switch type {
        case .defaultAlert:
            return configureDefaultAlert()
        }
    }
    
    private func configureDefaultAlert() -> UIAlertController {
        let alertVC = UIAlertController(
            title: Constants.TitleText.defaultAlertTitleText,
            message: Constants.MessageText.defaultAlertMessageText,
            preferredStyle: .alert
        )
        
        let alertAction = UIAlertAction(
            title: Constants.TitleText.defaultAlertActionTitleText,
            style: .cancel,
            handler: nil
        )
        
        alertVC.addAction(alertAction)
        
        alertVC.view.tintColor = .purple
        
        return alertVC
    }
}
