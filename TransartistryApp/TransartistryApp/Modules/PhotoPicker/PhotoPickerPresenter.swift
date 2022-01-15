//
//  PhotoPickerPresenter.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 02.01.2022.
//

import Foundation

protocol PhotoPickerPresenterProtocol: AnyObject {
    func presentAlert(of type: AlertType)
    func shouldDisplayActivityIndicator(decision: Bool)
}

final class PhotoPickerPresenter: PhotoPickerPresenterProtocol {
    
    weak var viewController: PhotoPickerViewControllerProtocol?
    
    func presentAlert(of type: AlertType) {
        let alertVC = AlertManager.shared.showAlert(type: type)
        viewController?.displayAlert(vc: alertVC)
    }
    
    func shouldDisplayActivityIndicator(decision: Bool) {
        viewController?.displayActivityIndicator(decision: decision)
    }
}
