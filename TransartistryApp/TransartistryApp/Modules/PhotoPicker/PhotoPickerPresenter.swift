//
//  PhotoPickerPresenter.swift
//  TransartistryApp
//
//  Created by Матвей Бойков on 02.01.2022.
//

import Foundation

protocol PhotoPickerPresenterProtocol {
    func presentAlert(of type: AlertType)
}

class PhotoPickerPresenter: PhotoPickerPresenterProtocol {
    
    weak var viewController: PhotoPickerViewControllerProtocol?
    
    func presentAlert(of type: AlertType) {
        let alertVC = AlertManager.shared.showAlert(type: type)
        viewController?.displayAlert(vc: alertVC)
    }
}
